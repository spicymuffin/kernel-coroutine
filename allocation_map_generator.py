import random

# generate ranges, shuffle them and write them to a file

NPAGES = 1024
MIN_RANGE_LEN = 1
MAX_RANGE_LEN = 20

ranges = []

i = 0
# range is a tuple (start, length)
while i < NPAGES:
    r = (i, random.randint(MIN_RANGE_LEN, MAX_RANGE_LEN))
    if r[0] + r[1] > NPAGES:
        r = (r[0], NPAGES - r[0])
    ranges.append(r)
    i += r[1]

# shuffle ranges
# the order of the ranges in the actual memory
order = range(len(ranges))

shuffled_order = []
ptrs = [0] * len(ranges)

order = list(range(len(ranges)))
for i in range(len(order)):
    idx = random.randint(0, len(order) - 1 - i)
    shuffled_order.append(order[idx])

    ptrs[order[idx]] = i

    tmp = order[len(order) - 1 - i]
    order[len(order) - 1 - i] = order[idx]
    order[idx] = tmp


print(shuffled_order)
print(ptrs)

allocation_starts = []

alloc_start_idx = 0
for i in range(len(shuffled_order)):
    allocation_starts.append(alloc_start_idx)
    alloc_start_idx += ranges[shuffled_order[i]][1]

print(ranges)
print(allocation_starts)

f = open("allocation_map.txt", "w")

# write ranges to file
for r in range(len(ranges)):
    s = str(ranges[r][0]) + \
        " " + \
        str(ranges[r][1]) + \
        " " + \
        str(allocation_starts[ptrs[r]])

    f.write(s + "\n")
    print(s)
