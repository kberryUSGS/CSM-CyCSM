cdef class SensorPartials:
  cdef CppSensorPartials thisptr

  def __cinit__(self, double ld, double sd):
      self.thisptr = CppSensorPartials(ld, sd)
