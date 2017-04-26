cdef class Version:
    def __cinit__(self, version):
        self.thisptr = new CppVersion(version)

    @property
    def version(self):
        return self.thisptr.version()
