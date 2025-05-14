#
# author: Daphné Larrivain <daphne.larrivain@ecole.ensicaen.fr>
#
# Python module that maps a given python function signature to its fully qualified java signature
#

import inspect

'''
Returns the fully qualified java signature of a given python function `func` 
'''
def signature(func):
    return f'{scope(func)} {return_type(func)} {package(func)}.{fclass(func)}.{fname(func)}({params(func)})'

'''
Returns the scope of a given python function `func`
'''
def scope(func):
    if func.__name__.startswith("__"):
        return "private"
    elif func.__name__.startswith("_"):
        return "protected"

    return "public"


'''
Returns the return type of a given python function `func`
'''
def return_type(func):
    if func.__annotations__ and "return" in func.__annotations__.keys():
        return convert(func.__annotations__["return"])
    elif "return " in inspect.getsource(func):    
        return "Object"
    return "void"


'''
Returns the package of a given python function `func` 
'''
def package(func):
    return func.__module__


'''
Returns the class name a given python function `func`
Equivalent of the file name if it doesn't belong to any class
'''
def fclass(func):
    class_name = func.__qualname__.split(".")[0]
    if class_name == func.__name__:
        return func.__module__.split(".")[-1]
    return class_name

'''
Returns the name of a given python function `func` 
'''
def fname(func):
    return func.__name__


'''
Returns the parameter list of a given python function `func` 
'''
def params(func):
    if func.__annotations__: 
        return params_type(func)
    return params_no_type(func)


'''
Subsidiary function:
Returns the parameter list of a function with parameter hints
'''
def params_type(func):
    return ", ".join(convert(t) for t in func.__annotations__.values())
    
 
'''
Subsidiary function:
Returns the parameter list of a function without parameter hints
'''   
def params_no_type(func):
    parameters = inspect.signature(func).parameters
    return ", ".join("Object" for name in parameters if name != "self")
    
    
'''
Maps python types to java types
'''
python_to_java = {
    "int": "int",
    "float": "double",
    "bool": "boolean",
    "str": "String",
    "list": "List<T>",
    "tuple": "Tuple<T1, T2>", # or List<T> for variable length
    "dict": "Map<K, V>",
    "set": "Set<T>",
    "None": "void",
    "bytes": "byte[]",
    "complex": "Pair<Double, Double>", # real & imaginary parts
    "object": "Object",
    "Callable": "Object", # functional Interface or lambda
    "Iterable": "Iterable<T>",
    "Generator": "Iterator<T>",
    "datetime": "Date"
}


'''
Converts python types to java types
'''
def convert(type):
    if type == None:
        return python_to_java["None"]
    if type.__name__ not in python_to_java:
        return "Object"
    return python_to_java[type.__name__]