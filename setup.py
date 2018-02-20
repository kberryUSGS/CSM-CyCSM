import os
import pkg_resources
import sys
import sysconfig
from setuptools import setup, Extension, find_packages
from Cython.Build import cythonize
from Cython.Distutils import build_ext




INCLUDE_DIRS = ['/scratch/csm/include/csm']
LIBRARY_DIRS = ['/scratch/csm/lib']  # This assumes that libcsmapi is installed in a standard place
LIBRARIES = ['csmapi']
COMPILE_ARGS = ['-g', '-std=c++11'] #, '-std=c++11']

if sys.platform == 'darwin':
    COMPILE_ARGS.append('-mmacosx-version-min=10.9')
elif sys.platform.startswith("win"):
    try:
        INCLUDE_DIRS.append(os.environ['LIBRARY_INC'])
        INCLUDE_DIRS.append(os.path.join(os.environ['LIBRARY_INC'], 'csm'))
    except: pass
    COMPILE_ARGS = []

incdir = os.path.dirname(sysconfig.get_path('include'))
incdir = os.path.join(incdir, 'csm')
INCLUDE_DIRS.append(incdir)

def generate_extension(path_name, sources):
    return Extension(path_name,
                sources=sources,
                extra_compile_args=COMPILE_ARGS,
                language='c++',
                include_dirs=INCLUDE_DIRS,
                runtime_library_dirs=LIBRARY_DIRS,
                #library_dirs=LIBRARY_DIRS,
                libraries=LIBRARIES)

# Create the extensions
extensions = [generate_extension('cycsm.isd', ['cycsm/isd.pyx']),
              generate_extension('cycsm.version', ['cycsm/version.pyx']),
              generate_extension('cycsm.csm', ['cycsm/csm.pyx']),
              generate_extension('cycsm.model', ['cycsm/model.pyx']),
              generate_extension('cycsm.correlationmodel', ['cycsm/correlationmodel.pyx']),
              generate_extension('cycsm.rastergm', ['cycsm/rastergm.pyx']),
              generate_extension('cycsm.ellipsoid', ['cycsm/ellipsoid.pyx'])]

setup(
    name='cycsm',
    version='0.1.0',
    cmdclass = {'build_ext':build_ext},
    ext_modules=cythonize(extensions),
    description='Cython wrapper to the Community Sensor Model API.',
    author='Jay Laura',
    packages = find_packages(),
    include_package_data=True)
