# serial 37

dnl From Jim Meyering.
dnl Check for the nanosleep function.
dnl If not found, use the supplied replacement.
dnl

# Copyright (C) 1999-2001, 2003-2018 Free Software Foundation, Inc.

# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

AC_DEFUN([gl_FUNC_NANOSLEEP],
[
 AC_REQUIRE([gl_HEADER_TIME_H_DEFAULTS])
 AC_REQUIRE([AC_CANONICAL_HOST]) dnl for cross-compiles

 dnl Persuade glibc and Solaris <time.h> to declare nanosleep.
 AC_REQUIRE([gl_USE_SYSTEM_EXTENSIONS])

 AC_CHECK_HEADERS_ONCE([sys/time.h])
 AC_REQUIRE([gl_FUNC_SELECT])

 nanosleep_save_libs=$LIBS

 # Solaris 2.5.1 needs -lposix4 to get the nanosleep function.
 # Solaris 7 prefers the library name -lrt to the obsolescent name -lposix4.
 LIB_NANOSLEEP=
 AC_SUBST([LIB_NANOSLEEP])
 AC_SEARCH_LIBS([nanosleep], [rt posix4],
                [test "$ac_cv_search_nanosleep" = "none required" ||
                 LIB_NANOSLEEP=$ac_cv_search_nanosleep])
 if test "x$ac_cv_search_nanosleep" != xno; then
   dnl The system has a nanosleep function.

   AC_REQUIRE([gl_MULTIARCH])
   if test $APPLE_UNIVERSAL_BUILD = 1; then
     # A universal build on Apple Mac OS X platforms.
     # The test result would be 'no (mishandles large arguments)' in 64-bit
     # mode but 'yes' in 32-bit mode. But we need a configuration result that
     # is valid in both modes.
     gl_cv_func_nanosleep='no (mishandles large arguments)'
   else
     gl_cv_func_nanosleep='yes'
   fi

   case "$gl_cv_func_nanosleep" in
     *yes)
       REPLACE_NANOSLEEP=0
       ;;
     *)
       REPLACE_NANOSLEEP=1
       case "$gl_cv_func_nanosleep" in
         *"mishandles large arguments"*)
           AC_DEFINE([HAVE_BUG_BIG_NANOSLEEP], [1],
             [Define to 1 if nanosleep mishandles large arguments.])
           ;;
         *)
           # The replacement uses select(). Add $LIBSOCKET to $LIB_NANOSLEEP.
           for ac_lib in $LIBSOCKET; do
             case " $LIB_NANOSLEEP " in
               *" $ac_lib "*) ;;
               *) LIB_NANOSLEEP="$LIB_NANOSLEEP $ac_lib";;
             esac
           done
           ;;
       esac
       ;;
   esac
 else
   HAVE_NANOSLEEP=0
 fi
 LIBS=$nanosleep_save_libs
])

# Prerequisites of lib/nanosleep.c.
AC_DEFUN([gl_PREREQ_NANOSLEEP],
[
  AC_CHECK_HEADERS_ONCE([sys/select.h])
  gl_PREREQ_SIG_HANDLER_H
])
