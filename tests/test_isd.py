import json

from cycsm.examples import get_path
from cycsm.isd import Isd

import numpy as np
import pytest

@pytest.fixture
def isd():
    return Isd()


def test_add_params(isd):

    isd.addparam('foo', 'bar')
    assert isd.param('foo') == 'bar'

    isd.addparam('foo', 1)
    assert isd.param('foo') == 'bar'
    assert isd.param('foo', 1) == 1

    l = [1,2,3.0]
    isd.addparam('list', l)
    for i in range(len(l)):
        assert isd.param('list', i) == l[i]

def test_add_numpy(isd):
    """
    The param object has no way to know that an input ndarray should
    be an ndarray back out, so we default to always returning a native Python
    type, e.g. a list.
    """
    x = np.arange(10)
    isd.addparam('ndarray', x)
    for i in range(len(x)):
        assert isd.param('ndarray', i) == x[i]

def test_create_from_json_file():
    """
    This dispatches to the loads call, testing that as well.
    """
    with open(get_path('isd.json')) as f:
        isd = Isd.load(f)
        f.seek(0)
        truth = json.load(f)

        for k, v in truth.items():
            if isinstance(v, list):
                for i in range(len(v)):
                    assert v[i] == isd.param(k, i)
            else:
                assert v == isd.param(k)

def test_create_from_socet_lis():
    socetlis = get_path('socet_isd.lis')
    socetell = get_path('ellipsoid.ell')
    isd = Isd.read_socet_file(socetlis, socetell)
    assert isd.param('COORD_SYSTEM') == 1
    assert isd.param('EPHEM_PTS', 3) == 8.5246579847096302546560764e+05
    assert False
