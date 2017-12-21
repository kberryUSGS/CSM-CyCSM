import ast
import json
import numpy as np
import re

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
            stream = json.loads(stream)
        for k, v in stream.items():
            isd.addparam(k, v)
        return isd

    @classmethod
    def read_socet_file(cls, keywords, ell=None):
        """
        Read a SocetSet ketwords.list file with optional ellipsoid file,
        convert into an dict and pipe to the loads method.
        """
        isd = cls()

        matcher = re.compile(r'\b(?!\d)\w+\b')
        numeric_matcher = re.compile(r'\W-?(?:0|[1-9]\d*)(?:\.\d*)?(?:[eE][+\-]?\d+)?')
        stream = {}
        with open(keywords, 'r') as f:
            for l in f:
                l = l.rstrip()
                if not l:
                    continue
                matches = matcher.findall(l)
                if matches:
                    key = matches[0]
                    stream[key] = []
                    # Case where the kw are strings after the key
                    if len(matches) > 1:
                        stream[key] = matches[1:]
                    # Case where the kw are numeric types after the key
                    else:
                        nums = numeric_matcher.findall(l)
                        if len(nums) == 1:
                            stream[key] = float(nums[0])
                        else:
                            stream[key] += map(float, nums)
                else:
                    # Case where the values are on a newline after the key
                    nums = numeric_matcher.findall(l)
                    stream[key] += map(float, nums)
        return cls.loads(stream)

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
