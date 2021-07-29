student_attendance = {"Rolf": 96, "Adam": 80, "Anne": 100}

for student in student_attendance:
    print(f"{student}: {student_attendance[student]}")

# can use the in keyword to check whether a value is one of the keys of the dictionary
if "Bob" in student_attendance:
    print(f"Bob: {student_attendance['Bob']}")
else:
    print("Bob is not a student in this class.")

# getting the values only
for student, attendance in student_attendance.items():
    print(f"{student}: {attendance}")