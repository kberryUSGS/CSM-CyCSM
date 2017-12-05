cdef class Ellipsoid:
    def __cinit__(self, semimajor, semiminor):
        self.thisptr = new CppEllipsoid(semimajor, semiminor)

    @property
    def semimajorradius(self):
        return self.thisptr.getSemiMajorRadius()

    @ property
    def semiminorradius(self):
        return self.thisptr.getSemiMinorRadius()

    def set_ellipsoid(self, semimajor, semiminor):
        self.thisptr.setEllipsoid(semimajor, semiminor)
