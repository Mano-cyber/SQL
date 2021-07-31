class ClassTest:
    def instance_method(self):
        print(f"Called instance_method of {self}")
    
    @classmethod
    def class_method(cls):
        print(f"Call class_method of {cls}")

    @staticmethod
    def static_method():
        print(f"Called static method.")    

#ClassTest.class_method()
ClassTest.static_method()