# Model
cdef extern from "Model.h" namespace "csm":
    cdef cppclass CppModel "csm::Model":
        Model() except +
