from cycsm import version

import pytest

@pytest.fixture()
def static_ver():
    return version.Version('1.2.3')

@pytest.mark.parametrize("ver, expected", [('1.0.0', [1,0,0]),
                                          ([1,0,0], [1,0,0])])
def test_instantiation(ver, expected):
    v = version.Version(ver)
    assert v.major == expected[0]
    assert v.minor == expected[1]
    assert v.revision == expected[2]

def test_equal():
    v1 = version.Version('1.0.0')
    v2 = version.Version([1,0,0])
    assert v1 == v2

def test_repr(static_ver):
    assert static_ver.__repr__() == '1.2.3'
