from libcpp.string cimport string

cdef extern from "Isd.h" namespace "csm":
    cdef cppclass CppIsd "csm::Isd":
        CppIsd() except +
        void addParam(string key, string value)
        string param(string key, int instance)
        void clearParams(string&)
        void clearAllParams()

cdef class Isd:
    cdef CppIsd *thisptr
