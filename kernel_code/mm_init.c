/* If zone is ZONE_MOVABLE but memory is mirrored, it is an overlapped init */
static bool __meminit
overlap_memmap_init(unsigned long zone, unsigned long* pfn)
{
    static struct memblock_region* r;

    if (mirrored_kernelcore && zone == ZONE_MOVABLE)
    {
        if (!r || *pfn >= memblock_region_memory_end_pfn(r))
        {
            for_each_mem_region(r)
            {
                if (*pfn < memblock_region_memory_end_pfn(r))
                    break;
            }
        }
        if (*pfn >= memblock_region_memory_base_pfn(r) &&
            memblock_is_mirror(r))
        {
            *pfn = memblock_region_memory_end_pfn(r);
            return true;
        }
    }
    return false;
}

/*
 * Only struct pages that correspond to ranges defined by memblock.memory
 * are zeroed and initialized by going through __init_single_page() during
 * memmap_init_zone_range().
 *
 * But, there could be struct pages that correspond to holes in
 * memblock.memory. This can happen because of the following reasons:
 * - physical memory bank size is not necessarily the exact multiple of the
 *   arbitrary section size
 * - early reserved memory may not be listed in memblock.memory
 * - non-memory regions covered by the contigious flatmem mapping
 * - memory layouts defined with memmap= kernel parameter may not align
 *   nicely with memmap sections
 *
 * Explicitly initialize those struct pages so that:
 * - PG_Reserved is set
 * - zone and node links point to zone and node that span the page if the
 *   hole is in the middle of a zone
 * - zone and node links point to adjacent zone/node if the hole falls on
 *   the zone boundary; the pages in such holes will be prepended to the
 *   zone/node above the hole except for the trailing pages in the last
 *   section that will be appended to the zone/node below.
 */
static void __init init_unavailable_range(unsigned long spfn,
    unsigned long epfn,
    int zone, int node)
{
    unsigned long pfn;
    u64 pgcnt = 0;

    for (pfn = spfn; pfn < epfn; pfn++)
    {
        if (!pfn_valid(pageblock_start_pfn(pfn)))
        {
            pfn = pageblock_end_pfn(pfn) - 1;
            continue;
        }
        __init_single_page(pfn_to_page(pfn), pfn, zone, node);
        __SetPageReserved(pfn_to_page(pfn));
        pgcnt++;
    }

    if (pgcnt)
        pr_info("On node %d, zone %s: %lld pages in unavailable ranges\n",
            node, zone_names[zone], pgcnt);
}

/*
 * Initially all pages are reserved - free ones are freed
 * up by memblock_free_all() once the early boot process is
 * done. Non-atomic initialization, single-pass.
 *
 * All aligned pageblocks are initialized to the specified migratetype
 * (usually MIGRATE_MOVABLE). Besides setting the migratetype, no related
 * zone stats (e.g., nr_isolate_pageblock) are touched.
 */
void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone,
    unsigned long start_pfn, unsigned long zone_end_pfn,
    enum meminit_context context,
    struct vmem_altmap* altmap, int migratetype)
{
    unsigned long pfn, end_pfn = start_pfn + size;
    struct page* page;

    if (highest_memmap_pfn < end_pfn - 1) highest_memmap_pfn = end_pfn - 1;

    #ifdef CONFIG_ZONE_DEVICE
    /*
     * Honor reservation requested by the driver for this ZONE_DEVICE
     * memory. We limit the total number of pages to initialize to just
     * those that might contain the memory mapping. We will defer the
     * ZONE_DEVICE page initialization until after we have released
     * the hotplug lock.
     */
    if (zone == ZONE_DEVICE)
    {
        if (!altmap)
            return;

        if (start_pfn == altmap->base_pfn)
            start_pfn += altmap->reserve;
        end_pfn = altmap->base_pfn + vmem_altmap_offset(altmap);
    }
    #endif

    for (pfn = start_pfn; pfn < end_pfn;)
    {
        /*
         * There can be holes in boot-time mem_map[]s handed to this
         * function.  They do not exist on hotplugged memory.
         */
        if (context == MEMINIT_EARLY)
        {
            if (overlap_memmap_init(zone, &pfn))
                continue;
            if (defer_init(nid, pfn, zone_end_pfn))
            {
                deferred_struct_pages = true;
                break;
            }
        }

        page = pfn_to_page(pfn);
        __init_single_page(page, pfn, zone, nid);
        if (context == MEMINIT_HOTPLUG) __SetPageReserved(page);

        /*
         * Usually, we want to mark the pageblock MIGRATE_MOVABLE,
         * such that unmovable allocations won't be scattered all
         * over the place during system boot.
         */

        if (pageblock_aligned(pfn))
        {
            set_pageblock_migratetype(page, migratetype);
            cond_resched();
        }
        pfn++;
    }
}

static void __init memmap_init_zone_range(struct zone* zone,
    unsigned long start_pfn,
    unsigned long end_pfn,
    unsigned long* hole_pfn)
{
    unsigned long zone_start_pfn = zone->zone_start_pfn;
    unsigned long zone_end_pfn = zone_start_pfn + zone->spanned_pages;
    int nid = zone_to_nid(zone), zone_id = zone_idx(zone);

    start_pfn = clamp(start_pfn, zone_start_pfn, zone_end_pfn);
    end_pfn = clamp(end_pfn, zone_start_pfn, zone_end_pfn);

    if (start_pfn >= end_pfn)
        return;

    memmap_init_range(end_pfn - start_pfn, nid, zone_id, start_pfn,
        zone_end_pfn, MEMINIT_EARLY, NULL, MIGRATE_MOVABLE);

    if (*hole_pfn < start_pfn)
        init_unavailable_range(*hole_pfn, start_pfn, zone_id, nid);

    *hole_pfn = end_pfn;
}

static void __init memmap_init(void)
{
    unsigned long start_pfn, end_pfn;
    unsigned long hole_pfn = 0;
    int i, j, zone_id = 0, nid;

    for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, &nid)
    {
        struct pglist_data* node = NODE_DATA(nid);

        for (j = 0; j < MAX_NR_ZONES; j++)
        {
            struct zone* zone = node->node_zones + j;

            if (!populated_zone(zone))
                continue;

            memmap_init_zone_range(zone, start_pfn, end_pfn,
                &hole_pfn);
            zone_id = j;
        }
    }

    #ifdef CONFIG_SPARSEMEM
    /*
     * Initialize the memory map for hole in the range [memory_end,
     * section_end].
     * Append the pages in this hole to the highest zone in the last
     * node.
     * The call to init_unavailable_range() is outside the ifdef to
     * silence the compiler warining about zone_id set but not used;
     * for FLATMEM it is a nop anyway
     */
    end_pfn = round_up(end_pfn, PAGES_PER_SECTION);
    if (hole_pfn < end_pfn)
        #endif
        init_unavailable_range(hole_pfn, end_pfn, zone_id, nid);
}
