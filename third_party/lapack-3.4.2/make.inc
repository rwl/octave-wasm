####################################################################
#  LAPACK make include file.                                       #
#  LAPACK, Version 3.4.0                                           #
#  April 2012                                                   #
####################################################################
#
SHELL = /bin/sh
#
#  Modify the FORTRAN and OPTS definitions to refer to the
#  compiler and desired compiler options for your machine.  NOOPT
#  refers to the compiler options desired when NO OPTIMIZATION is
#  selected.  Define LOADER and LOADOPTS to refer to the loader and
#  desired load options for your machine.
#
FORTRAN  = $(F77)
OPTS     = -O0 -fPIC -I$(INCDIR)
DRVOPTS  = $(OPTS)
NOOPT    = -O0 -fPIC -I$(INCDIR)
LOADER   = $(LD)
LOADOPTS = -O0 -shared
#LOADOPTS = -s LINKABLE=1 -s EXPORT_ALL=1 -s ERROR_ON_UNDEFINED_SYMBOLS=0
#
# Timer for the SECOND and DSECND routines
#
# Default : SECOND and DSECND will use a call to the EXTERNAL FUNCTION ETIME
#TIMER    = EXT_ETIME
# For RS6K : SECOND and DSECND will use a call to the EXTERNAL FUNCTION ETIME_
# TIMER    = EXT_ETIME_
# For gfortran compiler: SECOND and DSECND will use a call to the INTERNAL FUNCTION ETIME
TIMER    = INT_ETIME
# If your Fortran compiler does not provide etime (like Nag Fortran Compiler, etc...)
# SECOND and DSECND will use a call to the INTERNAL FUNCTION CPU_TIME
# TIMER    = INT_CPU_TIME
# If neither of this works...you can use the NONE value... In that case, SECOND and DSECND will always return 0
# TIMER     = NONE
#
#  Configuration LAPACKE: Native C interface to LAPACK
#  To generate LAPACKE library: type 'make lapackelib'
#  Configuration file: turned off (default)
#  Complex types: C99 (default)
#  Name pattern: mixed case (default)
#  (64-bit) Data model: LP64 (default)
#
# CC is the C compiler, normally invoked with options CFLAGS.
#
CC = emcc
CFLAGS = -O0 -I$(INCDIR) -fPIC -s LINKABLE=1 -s EXPORT_ALL=1
#
#  The archiver and the flag(s) to use when building archive (library)
#  If you system has no ranlib, set RANLIB = echo.
#
ARCH     = emar
ARCHFLAGS= cr
RANLIB   = emranlib
#
#  Location of the extended-precision BLAS (XBLAS) Fortran library
#  used for building and testing extended-precision routines.  The
#  relevant routines will be compiled and XBLAS will be linked only if
#  USEXBLAS is defined.
#
# USEXBLAS    = Yes
XBLASLIB     =
# XBLASLIB    = -lxblas
#
#  The location of the libraries to which you will link.  (The
#  machine-specific, optimized BLAS library should be used whenever
#  possible.)
#
BLASLIB      = ../../librefblas.so
LAPACKLIB    = libclapack.so
TMGLIB       = libtmglib.so
LAPACKELIB   = liblapacke.so
