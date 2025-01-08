import random

NBLOCKS = 1024 * 1024  # number of blocks (allocated or free)
NFREE = 1024 * 1024  # number of free blocks

# generate allocation map
allocation_map = [0] * NBLOCKS
for i in range(NFREE):
    allocation_map[i] = 1

random.shuffle(allocation_map)

f = open("allocation_map.txt", "w")

f.write(str(NBLOCKS) + "\n")
f.write(str(NFREE) + "\n")

for i in range(NBLOCKS):
    f.write(str(allocation_map[i]) + "\n")

f.close()
