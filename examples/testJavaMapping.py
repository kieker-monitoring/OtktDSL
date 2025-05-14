#
# author: Daphné Larrivain <daphne.larrivain@ecole.ensicaen.fr>
# Tests for the javaMapping module
#

from javaMapping import signature
import inspect

class DummyClass:
    # Method without type specification and without return
    def method_no_type_no_return(self):
        print("No type, no return")

    # Method without type specification but with return
    def method_no_type_with_return(self):
        return "No type, with return"

    # Method with type specification but without return
    def method_with_type_no_return(self, x: int):
        print(f"Received: {x}")

    # Method with type specification and with return
    def method_with_type_with_return(self, x: float) -> float:
        return x * 2

    # Method without parameters
    def method_no_params(self):
        print("No params")

    # Method with parameters
    def method_with_params(self, a, b):
        return a + b

    # Protected method (name starts with _)
    def _protected_method(self):
        print("This is a protected method")

    # Strongly private method (name starts with __)
    def __strong_private_method(self):
        print("This is a strongly private method")

# Function without type specification and without return
def func_no_type_no_return():
    print("No type, no return")

# Function without type specification but with return
def func_no_type_with_return():
    return "No type, with return"

# Function with type specification but without return
def func_with_type_no_return(x: int):
    print(f"Received: {x}")

# Function with type specification and with return
def func_with_type_with_return(x: float) -> float:
    return x * 2

# Function without parameters
def func_no_params():
    print("No params")

# Function with parameters
def func_with_params(a, b):
    return a + b

# Private function (name starts with _)
def _private_func():
    print("This is a private function")

# Strongly private function (name starts with __)
def __strong_private_func():
    print("This is a strongly private function")

if __name__ == "__main__":
    print("Functions\n")
    print(signature(func_no_type_no_return))
    print(signature(func_no_type_with_return))
    print(signature(func_with_type_no_return))
    print(signature(func_with_type_with_return))
    print(signature(func_no_params))
    print(signature(func_with_params))
    print(signature(_private_func))
    print(signature(__strong_private_func))

    print("\nMethods in class\n")
    print(signature(DummyClass.method_no_type_no_return))
    print(signature(DummyClass.method_no_type_with_return))
    print(signature(DummyClass.method_with_type_no_return))
    print(signature(DummyClass.method_with_type_with_return))
    print(signature(DummyClass.method_no_params))
    print(signature(DummyClass.method_with_params))
    print(signature(DummyClass._protected_method))
    #print(signature(DummyClass.__strong_private_method)) # Can't read it, private


