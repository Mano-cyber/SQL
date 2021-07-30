from typing import Sequence


add = lambda x, y: x + y

print(add(5, 7))

def double(x):
    return x * 2

sequence = [1, 3, 5, 9]
doubled = [double(x) for x in sequence]

doubled = list(map(double, sequence))
print(doubled)