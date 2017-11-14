from cycsm import version

class TestVersion:

    def test_version(self):
        v = version.Version(b"1.0.0")
        #assert v == "1.0.0"
