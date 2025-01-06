import random

N = 10000

f = open("allocation_map.txt", "r")
NBLOCKS = int(f.readline())
NFREE = int(f.readline())

allocation_map = [0] * NBLOCKS

freelist = [0] * NBLOCKS
freelistptr = 0

alloclist = [0] * NBLOCKS
alloclistptr = 0

for i in range(NBLOCKS):
    allocation_map[i] = int(f.readline())
    if allocation_map[i] == 1:
        freelist[freelistptr] = i
        freelistptr += 1
    else:
        alloclist[alloclistptr] = i
        alloclistptr += 1

f.close()

f = open("requests.txt", "w")

for i in range(N):
    # a for allocate
    # f for free
    # m for move
    s = "a " + str(random.randint(1, 200))
    f.write(s + "\n")

f.close()
