import random

NBLOCKS = 32 # number of blocks (allocated or free)
NFREE = 32 # number of free blocks

SHUFFLE = True

block_map_ptr = NBLOCKS - 1
block_map = [0] * NBLOCKS

for i in range(NBLOCKS):
    block_map[i] = i


f = open("allocation_map.txt", "w")
f.write(str(NBLOCKS) + "\n")
f.write(str(NFREE) + "\n")

if SHUFFLE:
    for i in range(NFREE):
        idx = random.randint(0, block_map_ptr)

        f.write(str(block_map[idx]) + "\n")

        tmp = block_map[idx]
        block_map[idx] = block_map[block_map_ptr]
        block_map[block_map_ptr] = tmp
        block_map_ptr -= 1
else:
    for i in range(NFREE):
        f.write(str(i) + "\n")

f.close()
