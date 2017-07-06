cdef extern from "csm.h" namespace "csm":
    cdef struct CppImageCoord "csm::ImageCoord":
        double line
        double samp

    cdef struct CppEcefCoord "csm::EcefCoord":
        double x
        double y
        double z

    cdef struct CppImageVector "csm::ImageVector":
        double line
        double samp

    cdef struct CppEcefVector "csm::EcefVector":
        double x
        double y
        double z

    cdef struct CppEcefLocus "csm::EcefLocus":
        CppEcefCoord point
        CppEcefVector direction

cdef extern from "csm.h" namespace "csm::param":
  cdef enum CppSet "csm::param::Set":
    pass

  cdef enum CppType "csm::param::Type":
    pass
