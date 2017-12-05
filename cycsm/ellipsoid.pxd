from cycsm.csm cimport CppEcefCoord

cdef extern from "Ellipsoid.h" namespace "csm":
    cdef cppclass CppEllipsoid "csm::Ellipsoid":
        CppEllipsoid(double semiMajorRadius, double semiMinorRadius) except +
        double getSemiMajorRadius()
        double getSemiMinorRadius()
        void setEllipsoid(double semiMajorRadius, double semiMinorRadius)

cdef class Ellipsoid:
    cdef CppEllipsoid *thisptr
