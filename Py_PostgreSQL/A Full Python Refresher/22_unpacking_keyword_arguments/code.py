#def named(**kwargs):
   # print(kwargs)

#named(name="Bob", age=25)

#and

def named(name, age):
    print(name, age)

details = {"name": "Bob", "age": 25}
named(**details)

#and

def named(**kwargs):
    print(kwargs)

def print_nicely(**kwargs):
    named(**kwargs)
    for arg, value in kwargs.items():
        print(f"{arg}: {value}")

print_nicely(name="Bob", age=25)

#and 

def both(*args, **kwargs):
    print(args)
    print(kwargs)

    both(1, 3, 5, name="Bob", age=25)