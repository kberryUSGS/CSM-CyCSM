import ast
import json
import numpy as np


cdef class Isd:
    #cdef CppIsd *thisptr

    def __cinit__(self):
        self.thisptr = new CppIsd()

    @classmethod
    def load(cls, fp):
        """
        Create an ISD object from a file object inline
        with
        """
        return cls.loads(fp.read())

    @classmethod
    def loads(cls, stream):
        """
        Create an isd from a stream, e.g. a string, or from a dict. If a 
        stream, attempt to load as JSON.

        Parameters
        ----------
        stream : str or dict
                 if str, assumed to be JSON encoded as a string

        Returns
        -------
        isd : object
              an ISD object
        """
        isd = cls()
        if not isinstance(stream, dict):
            d = json.loads(stream)
        for k, v in d.items():
            isd.addparam(k, v)
        return isd

    def addparam(self, key, value):
        key = str(key).encode()
        if isinstance(value, np.ndarray):
            value = value.tolist()
        if isinstance(value, list):
            for i in value:
                self.thisptr.addParam(key, str(i).encode())
        else:
            self.thisptr.addParam(key, str(value).encode())

    def param(self, key, instance=0):
        key = str(key).encode()
        value = self.thisptr.param(key, instance)
        try:
            return ast.literal_eval(value.decode())
        except:
            return value.decode()

    def clear_params(self, key):
        key = str(key).encode()
        self.thisptr.clearParams(key)

    def clear_all_params(self):
        self.thisptr.clearAllParams()
