python setup.py build_ext --include-dirs %LIBRARY_INC% --library-dirs %LIBRARY_LIB%
python setup.py install

if errorlevel 1 exit 1
