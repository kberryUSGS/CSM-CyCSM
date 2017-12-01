set LIBRARY_BIN=%ANACONDA%\Library\bin
set LIBRARY_INC=%ANACONDA%\Library\include
set LIBRARY_LIB=%ANADONDA%\Library\lib
set "PATH=%LIBRARY_BIN%;%LIBRARY_INC%;%LIBRARY_LIB%:%PATH%"

python setup.py install

if errorlevel 1 exit 1
