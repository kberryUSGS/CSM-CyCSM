from libcpp.string cimport string

# Model
cdef extern from "Model.h" namespace "csm":
    cdef cppclass CppModel "csm::Model":
        Model() except +
        string getFamily() except +
        string getModelName()
        string getPedigree()
        string getImageIdentifier()
        void setImageIdentifier()
        string getSensorIdentifier()
        string getPlatformIdentifier()
        string getCollectionIdentifier()
        string getTrajectoryIdentifier()
        string getSensorType()
        string getSensorMode()
        string getReferenceDateAndTime()
        string getModelState()
        void replaceModelState(string& argState)
        

cdef class Model:
    cdef CppModel *thisptr
