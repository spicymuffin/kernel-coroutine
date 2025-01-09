import subprocess

executable_path = './apl'

args = ['allocation_map.txt', 'requests.txt', '1']

command = [executable_path] + args

time_vals = []
nrequests_vals = []
requests_sec_vals = []
nblocks = 0

try:
    for i in range(10):
        result = subprocess.run(command, check=True,
                                text=True, stdout=subprocess.PIPE)
        vals = result.stdout.split('\n')
        nblocks = int(vals[0])

        print(f"time: {vals[1]}")
        print(f"nrequests: {vals[2]}")
        print(f"requests/sec: {vals[3]}")
        time_vals.append(float(vals[1]))
        nrequests_vals.append(int(vals[2]))
        requests_sec_vals.append(float(vals[3]))

    print(f"average time: {sum(time_vals) / len(time_vals)}")
    print(f"average nrequests: {sum(nrequests_vals) / len(nrequests_vals)}")
    print(
        f"average requests/sec: {sum(requests_sec_vals) / len(requests_sec_vals)}")

except subprocess.CalledProcessError as e:
    print(f"an error occurred: {e}")
