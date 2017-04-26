import pytest

from cycsm import csm

class TestImageVector:
    def test_default_creation(self):
        v = csm.ImageVector()
        assert v.line == 0
        assert v.sample == 0

    def test_parameterized_creation(self):
        v = csm.ImageVector(-1.0, 2)
        assert v.line == -1.0
        assert v.sample == 2

    def test_setters(self):
        v = csm.ImageVector(5.1, -0.3)
        assert v.line == 5.1
        assert v.sample == -0.3
        v.line = -5.1
        v.sample = 0.3
        assert v.line == -5.1
        assert v.sample == 0.3

class TestImageCoord:
    def test_default_creation(self):
        i = csm.ImageCoord()
        assert i.line == 0.0
        assert i.sample == 0.0

    def test_parameterized_creation(self):
        i = csm.ImageCoord(10, 1e6)
        assert i.line == 10
        assert i.sample == 1e6

    def test_setters(self):
        v = csm.ImageCoord(5.1, -0.3)
        assert v.line == 5.1
        assert v.sample == -0.3
        v.line = -5.1
        v.sample = 0.3
        assert v.line == -5.1
        assert v.sample == 0.3

class TestEcefCoord:
    def test_default_constructor(self):
        e = csm.EcefCoord()
        assert e.x == 0
        assert e.y == 0.0
        assert e.z == 0

    def test_parameterized_creation(self):
        e = csm.EcefCoord(-1e5, 12345, 0.1)
        assert e.x == -1e5
        assert e.y == 12345
        assert e.z == 0.1

    def test_setters(self):
        e = csm.EcefCoord(-1e5, 12345, 0.1)
        assert e.x == -1e5
        assert e.y == 12345
        assert e.z == 0.1

        e.x = 1
        e.y = 2
        e.z = 3
        assert e.x == 1
        assert e.y == 2
        assert e.z == 3

class TestEcefCoord:
    def test_default_constructor(self):
        e = csm.EcefVector()
        assert e.x == 0
        assert e.y == 0.0
        assert e.z == 0

    def test_parameterized_creation(self):
        e = csm.EcefVector(-1e5, 12345, 0.1)
        assert e.x == -1e5
        assert e.y == 12345
        assert e.z == 0.1

    def test_setters(self):
        e = csm.EcefVector(-1e5, 12345, 0.1)
        assert e.x == -1e5
        assert e.y == 12345
        assert e.z == 0.1

        e.x = 1
        e.y = 2
        e.z = 3
        assert e.x == 1
        assert e.y == 2
        assert e.z == 3

class TestEcefLocus:
    def test_default_constructor(self):
        e = csm.EcefLocus()
        assert e.point['x'] == 0
        assert e.direction['z'] == 0

    def test_set_direction(self):
        e = csm.EcefLocus()
        e.direction = [1.0, -5, 123]
        assert e.direction['x'] == 1.0
        assert e.direction['y'] == -5
        assert e.direction['z'] == 123

    def test_set_point(self):
        e = csm.EcefLocus()
        e.point = [1.0, -5, 123]
        assert e.point['x'] == 1.0
        assert e.point['y'] == -5
        assert e.point['z'] == 123
