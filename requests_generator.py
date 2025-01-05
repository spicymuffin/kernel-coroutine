import random

N = 10000

f = open("requests.txt", "w")
for i in range(N):
    # a for allocate
    # f for free
    # m for move
    s = "a " + str(random.randint(1, 200))

    f.write(s + "\n")
f.close()
