#include "mm_types.h"

#define NULL ((void*)0)

/*
 * Go through the free lists for the given migratetype and remove
 * the smallest available page from the freelists
 */
static inline struct page* __rmqueue_smallest(struct zone* zone, unsigned int order, int migratetype)
{
    unsigned int current_order;
    struct free_area* area;
    struct page* page;

    /* Find a page of the appropriate size in the preferred list */
    for (current_order = order; current_order < NR_PAGE_ORDERS; ++current_order)
    {
        area = &(zone->free_area[current_order]);
        page = get_page_from_free_area(area, migratetype);
        if (!page)
            continue;
        del_page_from_free_list(page, zone, current_order);
        expand(zone, page, order, current_order, migratetype);
        set_pcppage_migratetype(page, migratetype);
        // trace_mm_page_alloc_zone_locked(page, order, migratetype, pcp_allowed_order(order) && migratetype < MIGRATE_PCPTYPES);
        return page;
    }

    return NULL;
}


/*
 * Do the hard work of removing an element from the buddy allocator.
 * Call me with the zone->lock already held.
 */
static inline struct page* __rmqueue(struct zone* zone, unsigned int order, int migratetype,
    unsigned int alloc_flags)
{
    struct page* page;

    /*
    if (IS_ENABLED(CONFIG_CMA))
    {
        if (alloc_flags & ALLOC_CMA &&
            zone_page_state(zone, NR_FREE_CMA_PAGES) >
            zone_page_state(zone, NR_FREE_PAGES) / 2)
        {
            page = __rmqueue_cma_fallback(zone, order);
            if (page)
                return page;
        }
    }
    */
retry:
    page = __rmqueue_smallest(zone, order, migratetype);
    if (unlikely(!page))
    {
        // if (alloc_flags & ALLOC_CMA) page = __rmqueue_cma_fallback(zone, order);
        if (!page && __rmqueue_fallback(zone, order, migratetype, alloc_flags)) goto retry;
    }
    return page;
}

/*
 * Obtain a specified number of elements from the buddy allocator, all under
 * a single hold of the lock, for efficiency.  Add them to the supplied list.
 * Returns the number of new pages which were placed at *list.
 */
static int rmqueue_bulk(struct zone* zone, unsigned int order, unsigned long count, struct list_head* list, int migratetype, unsigned int alloc_flags)
{
    unsigned long flags;
    int i;

    /*
    spin_lock_irqsave(&zone->lock, flags);
    */
    for (i = 0; i < count; ++i)
    {
        struct page* page = __rmqueue(zone, order, migratetype,
            alloc_flags);
        if (unlikely(page == NULL))
            break;

        /*
         * Split buddy pages returned by expand() are received here in
         * physical page order. The page is added to the tail of
         * caller's list. From the callers perspective, the linked list
         * is ordered by page number under some conditions. This is
         * useful for IO devices that can forward direction from the
         * head, thus also in the physical page order. This is useful
         * for IO devices that can merge IO requests if the physical
         * pages are ordered properly.
         */
        list_add_tail(&page->pcp_list, list);
        if (is_migrate_cma(get_pcppage_migratetype(page))) __mod_zone_page_state(zone, NR_FREE_CMA_PAGES, -(1 << order));
    }

    /*
    __mod_zone_page_state(zone, NR_FREE_PAGES, -(i << order));
    spin_unlock_irqrestore(&zone->lock, flags);
    */

    return i;
}