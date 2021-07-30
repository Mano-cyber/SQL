def multiply(*arguments):
    print(arguments)
    total = 1
    for arg in arguments:
        total = total * arg

    return total

def apply(*arguments, operator):
    if operator == "*":
        return multiply(*argumenst)
    elif operator == "+":
        return sun(arguments)
    else:
        return "No valid operator()."

print(apply(1, 3, 6, 7, operator="*"))

#print(multiply(1, 3, 5))

def add(x, y):
    return x + y

nums = [3, 5]
print(add(*nums))
#or
nums = {"x": 15, "y": 25}
print(add(**nums))