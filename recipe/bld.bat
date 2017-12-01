setenv /x64 / release
set INCLUDE=%INCLUDE%;%LIBRARY_INC%
set LIB=%LIB%;%LIBRARY_BIN%;%LIBRARY_LIB%
set DISTUTILS_USE_SDK=1

python setup.py install

if errorlevel 1 exit 1
