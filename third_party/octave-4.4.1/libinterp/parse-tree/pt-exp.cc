/*

Copyright (C) 1996-2018 John W. Eaton

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

#if defined (HAVE_CONFIG_H)
#  include "config.h"
#endif

#include <iostream>
#include <string>

#include "error.h"
#include "pager.h"
#include "oct-lvalue.h"
#include "ov.h"
#include "pt-exp.h"

namespace octave
{
  // Expressions.

  octave_lvalue
  tree_expression::lvalue (tree_evaluator *)
  {
    error ("invalid lvalue function called in expression");
  }

  std::string
  tree_expression::original_text (void) const
  {
    return "";
  }
}
