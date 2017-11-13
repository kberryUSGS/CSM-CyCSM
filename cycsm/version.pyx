cdef class Version:
    def __cinit__(self, ver=None, major=1, minor=0, revision=0):
        if ver != None:
            pass
            #self.thisptr = new CppVersion(ver)
        else:
            self.thisptr = new CppVersion(major, minor, revision)

    def __eq__(self, other):
        return self.version == other.version
        
    @property
    def version(self):
        major = self.thisptr.major()
        minor = self.thisptr.minor()
        revision = self.thisptr.revision()
        return '{}.{}.{}'.format(major, minor, revision)

    @property
    def major(self):
        return self.thisptr.major()

    @property
    def minor(self):
        return self.thisptr.minor()

    @property
    def revision(self):
        return self.thisptr.revision()
