from libcpp.string cimport string

cdef extern from "Version.h" namespace "csm":
    cdef cppclass CppVersion "csm::Version":
        CppVersion(string version) except +
        string version()
        string version(unsigned int part)

cdef class Version:
    cdef CppVersion *thisptr
