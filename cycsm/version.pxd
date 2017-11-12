from libcpp.string cimport string

#cdef extern from "<iostream>" namespace "std":
#    cdef cppclass ostream:
#        ostream& write(const char*, int) except +

cdef extern from "Version.h" namespace "csm":
    cdef cppclass CppVersion "csm::Version":
        CppVersion(int major, int minor, int revision) except +
        #CppVersion(string &version ) except +
        #ostream& print(ostream os)
        #string version() except +
        string version(unsigned int part)
        int major()
        int minor()
        int revision()

cdef class Version:
    cdef CppVersion *thisptr
