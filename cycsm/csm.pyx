cdef class ImageVector:
    cdef CppImageVector thisptr

    def __cinit__(self, double line=0.0, sample=0.0):
        self.thisptr = CppImageVector(line, sample)

    @property
    def _ptr(self):
        return self.thisptr

    @property
    def line(self):
        return self.thisptr.line

    @line.setter
    def line(self, value):
        self.thisptr.line = value

    @property
    def sample(self):
        return self.thisptr.samp

    @sample.setter
    def sample(self, value):
        self.thisptr.samp = value


cdef class ImageCoord:
    cdef CppImageCoord thisptr

    def __cinit__(self, double line=0.0, double sample=0.0):
        self.thisptr = CppImageCoord(line, sample)

    def __repr__(self):
        return 'Line: {}, Sample: {}'.format(self.thisptr.line,
                                             self.thisptr.samp)

    def update(self, CppImageCoord &other):
        self.thisptr.line = other.line
        self.thisptr.samp = other.samp

    @property
    def _ptr(self):
        return self.thisptr

    @_ptr.setter
    def _ptr(self, val):
        self.thisptr = val

    @property
    def sample(self):
        return self.thisptr.samp

    @sample.setter
    def sample(self, double value):
        self.thisptr.samp = value

    @property
    def line(self):
        return self.thisptr.line

    @line.setter
    def line(self, double value):
        self.thisptr.line = value

cdef class EcefCoord:
    cdef CppEcefCoord thisptr

    def __cinit__(self, double x=0.0, double y=0.0, double z=0.0):
        self.thisptr = CppEcefCoord(x, y, z)

    def __repr__(self):
        return "{}, {}, {}".format(self.x, self.y, self.z)

    def update(self, CppEcefCoord &other):
        self.thisptr.x = other.x
        self.thisptr.y = other.y
        self.thisptr.z = other.z

    @property
    def _ptr(self):
        return self.thisptr

    @property
    def _ptr(self):
        return self.thisptr

    @property
    def x(self):
        return self.thisptr.x

    @x.setter
    def x(self, double value):
        self.thisptr.x = value
    @property
    def y(self):
        return self.thisptr.y
    @y.setter
    def y(self, double value):
        self.thisptr.y = value

    @property
    def z(self):
        return self.thisptr.z
    @z.setter
    def z(self, double value):
        self.thisptr.z = value

cdef class EcefVector:
    cdef CppEcefVector thisptr

    def __cinit__(self, double x=0.0, double y=0.0, double z=0.0):
        self.thisptr = CppEcefVector(x,y,z)

    def __repr__(self):
        return "{}, {}, {}".format(self.x, self.y, self.z)

    @property
    def _ptr(self):
        return self.thisptr

    @property
    def x(self):
        return self.thisptr.x

    @x.setter
    def x(self, double value):
        self.thisptr.x = value
    @property
    def y(self):
        return self.thisptr.y
    @y.setter
    def y(self, double value):
        self.thisptr.y = value

    @property
    def z(self):
        return self.thisptr.z
    @z.setter
    def z(self, double value):
        self.thisptr.z = value

cdef class EcefLocus:
    cdef CppEcefLocus thisptr

    def __cinit__(self):
        self.thisptr = CppEcefLocus()

    @property
    def _ptr(self):
        return self.thisptr

    @property
    def point(self):
        return self.thisptr.point

    @ property
    def direction(self):
        return self.thisptr.direction

    @point.setter
    def point(self, value):
        self.thisptr.point.x = value[0]
        self.thisptr.point.y = value[1]
        self.thisptr.point.z = value[2]

    @direction.setter
    def direction(self, value):
        self.thisptr.direction.x = value[0]
        self.thisptr.direction.y = value[1]
        self.thisptr.direction.z = value[2]
