#lists are mutable

a = []
b = a

a.append(35)

print(id(a))
print(id(b))