/* C++ code produced by gperf version 3.1 */
/* Command-line: gperf -t -C -D -G -L C++ -Z octave_kw_hash ../libinterp/parse-tree/octave.gperf  */
/* Computed positions: -k'1,5' */

#if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
      && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
      && (')' == 41) && ('*' == 42) && ('+' == 43) && (',' == 44) \
      && ('-' == 45) && ('.' == 46) && ('/' == 47) && ('0' == 48) \
      && ('1' == 49) && ('2' == 50) && ('3' == 51) && ('4' == 52) \
      && ('5' == 53) && ('6' == 54) && ('7' == 55) && ('8' == 56) \
      && ('9' == 57) && (':' == 58) && (';' == 59) && ('<' == 60) \
      && ('=' == 61) && ('>' == 62) && ('?' == 63) && ('A' == 65) \
      && ('B' == 66) && ('C' == 67) && ('D' == 68) && ('E' == 69) \
      && ('F' == 70) && ('G' == 71) && ('H' == 72) && ('I' == 73) \
      && ('J' == 74) && ('K' == 75) && ('L' == 76) && ('M' == 77) \
      && ('N' == 78) && ('O' == 79) && ('P' == 80) && ('Q' == 81) \
      && ('R' == 82) && ('S' == 83) && ('T' == 84) && ('U' == 85) \
      && ('V' == 86) && ('W' == 87) && ('X' == 88) && ('Y' == 89) \
      && ('Z' == 90) && ('[' == 91) && ('\\' == 92) && (']' == 93) \
      && ('^' == 94) && ('_' == 95) && ('a' == 97) && ('b' == 98) \
      && ('c' == 99) && ('d' == 100) && ('e' == 101) && ('f' == 102) \
      && ('g' == 103) && ('h' == 104) && ('i' == 105) && ('j' == 106) \
      && ('k' == 107) && ('l' == 108) && ('m' == 109) && ('n' == 110) \
      && ('o' == 111) && ('p' == 112) && ('q' == 113) && ('r' == 114) \
      && ('s' == 115) && ('t' == 116) && ('u' == 117) && ('v' == 118) \
      && ('w' == 119) && ('x' == 120) && ('y' == 121) && ('z' == 122) \
      && ('{' == 123) && ('|' == 124) && ('}' == 125) && ('~' == 126))
/* The character set is not based on ISO-646.  */
#error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gperf@gnu.org>."
#endif

#line 1 "../libinterp/parse-tree/octave.gperf"


////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 1995-2022 The Octave Project Developers
//
// See the file COPYRIGHT.md in the top-level directory of this
// distribution or <https://octave.org/copyright/>.
//
// This file is part of Octave.
//
// Octave is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Octave is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Octave; see the file COPYING.  If not, see
// <https://www.gnu.org/licenses/>.
//
// NOTE: gperf 2.7.2 will silently generate bad code if there are blank
// lines following the "%{" marker above.  This comment block seems to be
// handled correctly.
//
////////////////////////////////////////////////////////////////////////

enum octave_kw_id
{
  arguments_kw,
  break_kw,
  case_kw,
  catch_kw,
  classdef_kw,
  continue_kw,
  do_kw,
  else_kw,
  elseif_kw,
  end_kw,
  end_try_catch_kw,
  end_unwind_protect_kw,
  endarguments_kw,
  endclassdef_kw,
  endenumeration_kw,
  endevents_kw,
  endfor_kw,
  endfunction_kw,
  endif_kw,
  endmethods_kw,
  endparfor_kw,
  endproperties_kw,
  endspmd_kw,
  endswitch_kw,
  endwhile_kw,
  enumeration_kw,
  events_kw,
  for_kw,
  function_kw,
  get_kw,
  global_kw,
  if_kw,
  magic_file_kw,
  magic_line_kw,
  methods_kw,
  otherwise_kw,
  parfor_kw,
  persistent_kw,
  properties_kw,
  return_kw,
  set_kw,
  spmd_kw,
  switch_kw,
  try_kw,
  until_kw,
  unwind_protect_kw,
  unwind_protect_cleanup_kw,
  while_kw
};

#line 86 "../libinterp/parse-tree/octave.gperf"
struct octave_kw { const char *name; int tok; octave_kw_id kw_id; };

#define TOTAL_KEYWORDS 48
#define MIN_WORD_LENGTH 2
#define MAX_WORD_LENGTH 22
#define MIN_HASH_VALUE 2
#define MAX_HASH_VALUE 71
/* maximum key range = 70, duplicates = 0 */

class octave_kw_hash
{
private:
  static inline unsigned int hash (const char *str, size_t len);
public:
  static const struct octave_kw *in_word_set (const char *str, size_t len);
};

inline unsigned int
octave_kw_hash::hash (const char *str, size_t len)
{
  static const unsigned char asso_values[] =
    {
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 55, 72,  5, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72,  5, 72, 25,  0, 10,
       0,  0, 30, 40, 50, 30, 72,  0, 30,  5,
      10, 10, 10, 72,  0,  5, 25, 35, 35, 20,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72
    };
  unsigned int hval = len;

  switch (hval)
    {
      default:
        hval += asso_values[static_cast<unsigned char>(str[4])];
      /*FALLTHROUGH*/
      case 4:
      case 3:
      case 2:
      case 1:
        hval += asso_values[static_cast<unsigned char>(str[0])];
        break;
    }
  return hval;
}

static const struct octave_kw wordlist[] =
  {
#line 95 "../libinterp/parse-tree/octave.gperf"
    {"do", DO, do_kw},
#line 98 "../libinterp/parse-tree/octave.gperf"
    {"end", END, end_kw},
#line 96 "../libinterp/parse-tree/octave.gperf"
    {"else", ELSE, else_kw},
#line 90 "../libinterp/parse-tree/octave.gperf"
    {"break", BREAK, break_kw},
#line 126 "../libinterp/parse-tree/octave.gperf"
    {"return", FUNC_RET, return_kw},
#line 127 "../libinterp/parse-tree/octave.gperf"
    {"set", SET, set_kw},
#line 128 "../libinterp/parse-tree/octave.gperf"
    {"spmd", SPMD, spmd_kw},
#line 108 "../libinterp/parse-tree/octave.gperf"
    {"endmethods", END, endmethods_kw},
#line 114 "../libinterp/parse-tree/octave.gperf"
    {"enumeration", ENUMERATION, enumeration_kw},
#line 101 "../libinterp/parse-tree/octave.gperf"
    {"endarguments", END, endarguments_kw},
#line 110 "../libinterp/parse-tree/octave.gperf"
    {"endproperties", END, endproperties_kw},
#line 91 "../libinterp/parse-tree/octave.gperf"
    {"case", CASE, case_kw},
#line 105 "../libinterp/parse-tree/octave.gperf"
    {"endfor", END, endfor_kw},
#line 111 "../libinterp/parse-tree/octave.gperf"
    {"endspmd", END, endspmd_kw},
#line 136 "../libinterp/parse-tree/octave.gperf"
    {"__LINE__", NUMBER, magic_line_kw},
#line 122 "../libinterp/parse-tree/octave.gperf"
    {"otherwise", OTHERWISE, otherwise_kw},
#line 125 "../libinterp/parse-tree/octave.gperf"
    {"properties", PROPERTIES, properties_kw},
#line 129 "../libinterp/parse-tree/octave.gperf"
    {"switch", SWITCH, switch_kw},
#line 121 "../libinterp/parse-tree/octave.gperf"
    {"methods", METHODS, methods_kw},
#line 93 "../libinterp/parse-tree/octave.gperf"
    {"classdef", CLASSDEF, classdef_kw},
#line 103 "../libinterp/parse-tree/octave.gperf"
    {"endenumeration", END, endenumeration_kw},
#line 134 "../libinterp/parse-tree/octave.gperf"
    {"while", WHILE, while_kw},
#line 123 "../libinterp/parse-tree/octave.gperf"
    {"parfor", PARFOR, parfor_kw},
#line 130 "../libinterp/parse-tree/octave.gperf"
    {"try", TRY, try_kw},
#line 112 "../libinterp/parse-tree/octave.gperf"
    {"endswitch", END, endswitch_kw},
#line 115 "../libinterp/parse-tree/octave.gperf"
    {"events", EVENTS, events_kw},
#line 120 "../libinterp/parse-tree/octave.gperf"
    {"if", IF, if_kw},
#line 116 "../libinterp/parse-tree/octave.gperf"
    {"for", FOR, for_kw},
#line 109 "../libinterp/parse-tree/octave.gperf"
    {"endparfor", END, endparfor_kw},
#line 107 "../libinterp/parse-tree/octave.gperf"
    {"endif", END, endif_kw},
#line 97 "../libinterp/parse-tree/octave.gperf"
    {"elseif", ELSEIF, elseif_kw},
#line 99 "../libinterp/parse-tree/octave.gperf"
    {"end_try_catch", END, end_try_catch_kw},
#line 89 "../libinterp/parse-tree/octave.gperf"
    {"arguments", ARGUMENTS, arguments_kw},
#line 102 "../libinterp/parse-tree/octave.gperf"
    {"endclassdef", END, endclassdef_kw},
#line 118 "../libinterp/parse-tree/octave.gperf"
    {"get", GET, get_kw},
#line 104 "../libinterp/parse-tree/octave.gperf"
    {"endevents", END, endevents_kw},
#line 106 "../libinterp/parse-tree/octave.gperf"
    {"endfunction", END, endfunction_kw},
#line 94 "../libinterp/parse-tree/octave.gperf"
    {"continue", CONTINUE, continue_kw},
#line 124 "../libinterp/parse-tree/octave.gperf"
    {"persistent", PERSISTENT, persistent_kw},
#line 100 "../libinterp/parse-tree/octave.gperf"
    {"end_unwind_protect", END, end_unwind_protect_kw},
#line 113 "../libinterp/parse-tree/octave.gperf"
    {"endwhile", END, endwhile_kw},
#line 132 "../libinterp/parse-tree/octave.gperf"
    {"unwind_protect", UNWIND, unwind_protect_kw},
#line 117 "../libinterp/parse-tree/octave.gperf"
    {"function", FCN, function_kw},
#line 92 "../libinterp/parse-tree/octave.gperf"
    {"catch", CATCH, catch_kw},
#line 133 "../libinterp/parse-tree/octave.gperf"
    {"unwind_protect_cleanup", CLEANUP, unwind_protect_cleanup_kw},
#line 135 "../libinterp/parse-tree/octave.gperf"
    {"__FILE__", DQ_STRING, magic_file_kw},
#line 131 "../libinterp/parse-tree/octave.gperf"
    {"until", UNTIL, until_kw},
#line 119 "../libinterp/parse-tree/octave.gperf"
    {"global", GLOBAL, global_kw}
  };

static const signed char gperf_lookup[] =
  {
    -1, -1,  0,  1,  2,  3,  4, -1,  5,  6,  7,  8,  9, 10,
    11, -1, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, -1,
    23, 24, -1, 25, 26, 27, 28, 29, 30, -1, 31, 32, -1, 33,
    -1, 34, 35, -1, 36, -1, 37, -1, 38, -1, -1, 39, -1, -1,
    -1, -1, 40, 41, -1, -1, -1, 42, -1, 43, -1, 44, 45, -1,
    46, 47
  };

const struct octave_kw *
octave_kw_hash::in_word_set (const char *str, size_t len)
{
  if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
    {
      unsigned int key = hash (str, len);

      if (key <= MAX_HASH_VALUE)
        {
          int index = gperf_lookup[key];

          if (index >= 0)
            {
              const char *s = wordlist[index].name;

              if (*str == *s && !strcmp (str + 1, s + 1))
                return &wordlist[index];
            }
        }
    }
  return 0;
}
