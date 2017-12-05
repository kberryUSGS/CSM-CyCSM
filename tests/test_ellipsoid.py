from cycsm.ellipsoid import Ellipsoid

import pytest

@pytest.mark.parametrize("semimajor, semiminor", [(6378137, 6356752.314),  # WGS84
                                                  (3396190, 3376200),  # Mars 2000
                                                  (3396190, 3396190),  # Mars 2000 Sphere
                                                  (2439000, 2439000),  # Mercury
                                                  (26200000, 25571000)]) # Uranus
def test_instantiate(semimajor, semiminor):
    e = Ellipsoid(semimajor, semiminor)
    assert e.semimajorradius == semimajor
    assert e.semiminorradius == semiminor
