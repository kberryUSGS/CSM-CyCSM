:: Update the PATH to include the Anaconda Library
set "PATH=%LIBRARY_BIN%;%LIBRARY_INC%;%LIBRARY_LIB%;%PATH%"

python setup.py install

if errorlevel 1 exit 1
