import sys
import subprocess
import random

random.seed(1337)

for _ in range(100):
    input_ = " ".join(list(map(str, [random.randint(-10000, 10000) for _ in range(random.randint(10, 1000))]))) + "\n"
    result1 = subprocess.run(
        [sys.argv[1]], capture_output=True, text=True, input=input_
    )
    result2 = subprocess.run(
        [sys.argv[2]], capture_output=True, text=True, input=input_
    )
    if (result1.stdout != result2.stdout):
        print("ERROR: OUTPUT DOES NOT MATCH")
        print("input:", input_)
        print("output1:", result1.stdout)
        print("output2:", result2.stdout)
        exit()
print("ALL TESTS PASSED, RESULTS IDENTICAL FOR BOTH PROGRAMS")
