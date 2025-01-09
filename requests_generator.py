import random

MAX_ALLOC_REQUEST_SZ = 2016

f = open("allocation_map_1mil.txt", "r")
NBLOCKS = int(f.readline())
NFREE = int(f.readline())

allocation_map = [0] * NBLOCKS

freelist = [0] * NBLOCKS
freelistptr = 0
freelistsz = NFREE

alloclist = [0] * NBLOCKS
alloclistptr = 0
alloclistsz = NBLOCKS - NFREE

for i in range(NBLOCKS):
    allocation_map[i] = int(f.readline())
    if allocation_map[i] == 1:
        freelist[freelistptr] = i
        freelistptr += 1
    else:
        alloclist[alloclistptr] = i
        alloclistptr += 1

f.close()

NALLOC = 1024 * 1024
NFREE = 1024 * 1024

alloced_blocks = 0
freed_blocks = 0

f = open("requests.txt", "w")

while alloced_blocks < NALLOC or freed_blocks < NFREE:
    a = random.randint(0, 1)

    if a == 0 and freelistsz > 0 and alloced_blocks < NALLOC:
        alloccnt = random.randint(1, MAX_ALLOC_REQUEST_SZ)

        if (freelistsz < alloccnt):
            alloccnt = freelistsz

        f.write("a " + str(alloccnt) + "\n")

        for j in range(alloccnt):
            allocidx = random.randint(0, freelistptr - 1)
            allocaddr = freelist[allocidx]
            alloclist[alloclistptr] = allocaddr
            alloclistptr += 1
            alloclistsz += 1

            freelist[allocidx] = freelist[freelistptr - 1]
            freelistptr -= 1
            freelistsz -= 1

        alloced_blocks += alloccnt

    elif a == 2 and freelistsz > 0 and alloced_blocks < NALLOC:
        allocidx = random.randint(0, freelistptr - 1)
        allocaddr = freelist[allocidx]
        
        f.write("d " + str(allocaddr) + "\n")

        alloclist[alloclistptr] = allocaddr
        alloclistptr += 1
        alloclistsz += 1

        freelist[allocidx] = freelist[freelistptr - 1]
        freelistptr -= 1
        freelistsz -= 1

        alloced_blocks += 1
        # print("alloced_blocks:", alloced_blocks)

    elif a == 1 and alloclistsz > 0 and freed_blocks < NFREE:
        freeidx = random.randint(0, alloclistptr - 1)
        alloccnt = alloclist[freeidx]
        f.write("f " + str(alloccnt) + "\n")
        freelist[freelistptr] = alloccnt
        freelistptr += 1
        freelistsz += 1

        alloclist[freeidx] = alloclist[alloclistptr - 1]
        alloclistptr -= 1
        alloclistsz -= 1

        freed_blocks += 1


print("alloced_blocks:", alloced_blocks)
print("freed_blocks:", freed_blocks)

f.close()
