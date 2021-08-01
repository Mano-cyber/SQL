def divide(dividend, divisor):
    if divisor == 0:
        raise ZeroDivisionError("Cannot divide by 0")

    return dividend / divisor

def Calculate(*values, operator):
    return operator(*values)

result = Calculate(25, 5, operator=divide)
print(result)