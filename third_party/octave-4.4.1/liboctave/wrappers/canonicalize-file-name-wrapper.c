/*

Copyright (C) 2016-2018 John W. Eaton

This file is part of Octave.

Octave is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Octave is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Octave; see the file COPYING.  If not, see
<https://www.gnu.org/licenses/>.

*/

// canonicalize_file_name may be provided by gnulib.  We don't include
// gnulib headers directly in Octave's C++ source files to avoid
// problems that may be caused by the way that gnulib overrides standard
// library functions.

#if defined (HAVE_CONFIG_H)
#  include "config.h"
#endif

#include <stdlib.h>

#include "canonicalize-file-name-wrapper.h"

char *
octave_canonicalize_file_name_wrapper (const char *name)
{
//  return canonicalize_file_name (name);
  return realpath (name, NULL);
}
