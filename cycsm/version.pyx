cdef class Version:
    def __cinit__(self, ver):
        if isinstance(ver, str):
            self.thisptr = new CppVersion(ver.encode())
        else:
            if len(ver) != 3:
                raise ValueError('list version must have 3 entries: [major, minor, revision]')
            major = ver[0]
            minor = ver[1]
            revision = ver[2]
            self.thisptr = new CppVersion(major, minor, revision)

    def __repr__(self):
        return '.'.join(map(str, self.as_list()))

    def __eq__(self, other):
        return self.as_list() == other.as_list()

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

    def as_list(self):
        return [self.major, self.minor, self.revision]
