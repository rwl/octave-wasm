/*

Copyright (C) 2017-2018 John W. Eaton

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

#if ! defined (octave_uniconv_wrappers_h)
#define octave_uniconv_wrappers_h 1

#if defined (__cplusplus)
#  include <cstddef>
#  include <cstdint>
#else
#  include <stddef.h>
#  include <stdint.h>
#endif

#if defined __cplusplus
extern "C" {
#endif

// Since we omit arguments we don't care about in Octave, these aren't
// named with the _wrapper suffix.

extern uint8_t *
octave_u8_conv_from_encoding (const char *fromcode, const char *src,
                              size_t srclen, size_t *lengthp);

extern char *
octave_u8_conv_to_encoding (const char *tocode, const uint8_t *src,
                            size_t srclen, size_t *lengthp);

#if defined __cplusplus
}
#endif

#endif
