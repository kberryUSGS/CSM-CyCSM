cdef extern from "csm.h" namespace "csm::param":
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
