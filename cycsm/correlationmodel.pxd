cdef extern from "CorrelationModel.h" namespace "csm":
    cdef cppclass CppNoCorrelationModel "csm::NoCorrelationModel":
        CppNoCorrelationModel() except +
        size_t getNumSensorModelParameters()
        getCorrelationParameterGroup(size_t smParamIndex) except +
        getCorrelationCoefficient(size_t cpGroupIndex, double deltaTime) except +

cdef class NoCorrelationModel:
    cdef CppNoCorrelationModel *thisptr
