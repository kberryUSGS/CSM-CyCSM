python setup.py build --compiler=msvc --include-dirs %LIBRARY_INC% -- library-dirs %LIBRARY_LIB%;%LIBRARY_BIN%
python setup.py install

if errorlevel 1 exit 1
