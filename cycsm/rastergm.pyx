cdef class SensorPartials:
  cdef CppSensorPartials thisptr

  def __cinit_(self, double ld, double sd):
      self.thisptr = CppSensorPartials(ld, sd)
