from libcpp.pair cimport pair

cdef extern from "RasterGM.h" namespace "csm":
    ctypedef pair[double,double] CppSensorPartials "csm::RasterGM::SensorPartials"
