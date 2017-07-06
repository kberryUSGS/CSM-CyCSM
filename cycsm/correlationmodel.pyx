cdef class NoCorrelationModel:
    def __cinit__(self):
        self.thisptr = new CppNoCorrelationModel()

    @property
    def num_sensormodel_parameters(self):
        return self.thisptr.getNumSensorModelParameters()
