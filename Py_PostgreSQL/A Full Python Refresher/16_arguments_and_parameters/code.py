#function with parameters
def add(x, y):
    result = x + y
    print(result)

add(5, 3)

#fuction without parameters
def say_hello(name):
    print(f"Hello, {name}")

say_hello("Bob")

#named or keyword arguments
def say_hello(name, surname):
    print(f"Hello, {name} {surname}")

say_hello(name="Bob", surname="Smith")

#divide function
def divide(dividend, divisor):
    if divisor != 0:
        print(dividend / divisor)
    else:
        print("You fool!")

divide(dividend=15, divisor=0)