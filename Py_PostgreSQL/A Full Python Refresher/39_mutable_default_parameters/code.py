from typing import List

class Student:
    def __init__(self, name: str, grades: List[int] = []): #bad idea
        self.name = name
        self.grades = grades
    
    def take_exam(self, results: int):
        self.grades.append(results)

bob = Student("Bob")
rolf = Student("Rolf")
bob.take_exam(90)
print(bob.grades)
print(rolf.grades)

#solution

from typing import List, Optional

class Student:
    def __init__(self, name: str, grades: Optional[List[int]] = None): #bad idea
        self.name = name
        self.grades = grades
    
    def take_exam(self, results: int):
        self.grades.append(results)

bob = Student("Bob")
rolf = Student("Rolf")
bob.take_exam(90)
print(bob.grades)
print(rolf.grades)