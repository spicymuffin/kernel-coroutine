import random

NBLOCKS = 1024 * 1024 # total number of blocks
NFREE = 1024 * 1024 # number of free blocks to output

SHUFFLE = False  # original random approach
STREAK = True  # generate blocks in random consecutive streaks

STREAK_MIN = 1
STREAK_MAX = 50

# Prepare the block_map for SHUFFLE mode
block_map_ptr = NBLOCKS - 1
block_map = [0] * NBLOCKS
for i in range(NBLOCKS):
    block_map[i] = i

# Helper function for STREAK mode:
# Generates a list of streak sizes (each between 10 and 100) that together sum to total_blocks.
def generate_streak_sizes(total_blocks):
    sizes = []
    allocated = 0
    while allocated < total_blocks:
        size = random.randint(STREAK_MIN, STREAK_MAX)
        if allocated + size > total_blocks:
            size = total_blocks - allocated
        sizes.append(size)
        allocated += size
    return sizes

with open("allocation_map.txt", "w") as f:
    # Write out header lines
    f.write(str(NBLOCKS) + "\n")
    f.write(str(NFREE) + "\n")

    # ---- STREAK MODE ----
    if STREAK:
        # 1. Generate random streak sizes that sum up to NFREE
        streak_sizes = generate_streak_sizes(NFREE)

        # 2. Create a list of blocks [0, 1, 2, ..., NFREE-1]
        #    (these are the "free" blocks in consecutive order)
        consecutive_blocks = list(range(NFREE))

        # 3. Slice this list into sub-lists (streaks)
        streaks = []
        start_idx = 0
        for size in streak_sizes:
            streak = consecutive_blocks[start_idx : start_idx + size]
            streaks.append(streak)
            start_idx += size

        # 4. Shuffle the list of streaks
        random.shuffle(streaks)

        # 5. Write them out in the shuffled order,
        #    while preserving consecutive order inside each streak
        for streak in streaks:
            for block in streak:
                f.write(str(block) + "\n")

    # ---- SHUFFLE MODE ----
    elif SHUFFLE:
        # Original random selection code:
        for i in range(NFREE):
            idx = random.randint(0, block_map_ptr)
            f.write(str(block_map[idx]) + "\n")
            # Swap the chosen index with the end, then shrink the available range
            block_map[idx], block_map[block_map_ptr] = block_map[block_map_ptr], block_map[idx]
            block_map_ptr -= 1

    # ---- SEQUENTIAL MODE (both STREAK and SHUFFLE are False) ----
    else:
        # Write out blocks from 0 up to NFREE - 1 in ascending order
        for i in range(NFREE):
            f.write(str(i) + "\n")
