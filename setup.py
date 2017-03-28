import os
import pkg_resources
import sys
from setuptools import setup, Extension, find_packages
from Cython.Build import cythonize
from Cython.Distutils import build_ext

INCLUDE_DIRS = ['cycsm/include/']
LIBRARY_DIRS = []  # This assumes that libcsmapi is installed in a standard place
LIBRARIES = ['csmapi']
COMPILE_ARGS = ['-g', '-std=c++11']#, '-stdlib=libc++']

def generate_extension(path_name, sources):
    return Extension(path_name,
                sources=sources,
                extra_compile_args=COMPILE_ARGS,
                language='c++',
                include_dirs=INCLUDE_DIRS,
                runtime_library_dirs=LIBRARY_DIRS,
                library_dirs=LIBRARY_DIRS,
                libraries=LIBRARIES)

if sys.platform == 'darwin':
    COMPILE_ARGS.append('-mmacosx-version-min=10.9')

# Create the extensions
extensions = [generate_extension('cycsm.isd', ['cycsm/isd.pyx']),
              generate_extension('cycsm.csm', ['cycsm/csm.pyx']),
              generate_extension('cycsm.model', ['cycsm/model.pyx'])]

setup(
    name='cycsm',
    version='0.1.0',
    cmdclass = {'build_ext':build_ext},
    ext_modules=cythonize(extensions),
    description='Cython wrapper to the Community Sensor Model API.',
    author='Jay Laura',
    packages = find_packages(),
    include_package_data=True)
