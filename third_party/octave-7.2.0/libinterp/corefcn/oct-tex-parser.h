/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_OCTAVE_TEX_LIBINTERP_COREFCN_OCT_TEX_PARSER_H_INCLUDED
# define YY_OCTAVE_TEX_LIBINTERP_COREFCN_OCT_TEX_PARSER_H_INCLUDED
/* Debug traces.  */
#ifndef OCTAVE_TEX_DEBUG
# if defined YYDEBUG
#if YYDEBUG
#   define OCTAVE_TEX_DEBUG 1
#  else
#   define OCTAVE_TEX_DEBUG 0
#  endif
# else /* ! defined YYDEBUG */
#  define OCTAVE_TEX_DEBUG 0
# endif /* ! defined YYDEBUG */
#endif  /* ! defined OCTAVE_TEX_DEBUG */
#if OCTAVE_TEX_DEBUG
extern int octave_tex_debug;
#endif
/* "%code requires" blocks.  */
#line 62 "../libinterp/corefcn/oct-tex-parser.yy"
#include <string>

#line 60 "libinterp/corefcn/oct-tex-parser.h"

/* Token kinds.  */
#ifndef OCTAVE_TEX_TOKENTYPE
# define OCTAVE_TEX_TOKENTYPE
  enum octave_tex_tokentype
  {
    OCTAVE_TEX_EMPTY = -2,
    OCTAVE_TEX_EOF = 0,            /* "end of file"  */
    OCTAVE_TEX_error = 256,        /* error  */
    OCTAVE_TEX_UNDEF = 257,        /* "invalid token"  */
    BF = 258,                      /* BF  */
    IT = 259,                      /* IT  */
    SL = 260,                      /* SL  */
    RM = 261,                      /* RM  */
    FONTNAME = 262,                /* FONTNAME  */
    FONTSIZE = 263,                /* FONTSIZE  */
    COLOR = 264,                   /* COLOR  */
    COLOR_RGB = 265,               /* COLOR_RGB  */
    START = 266,                   /* START  */
    END = 267,                     /* END  */
    SUPER = 268,                   /* SUPER  */
    SUB = 269,                     /* SUB  */
    CH = 270,                      /* CH  */
    NUM = 271,                     /* NUM  */
    SYM = 272,                     /* SYM  */
    SCRIPT = 273,                  /* SCRIPT  */
    STR = 274                      /* STR  */
  };
  typedef enum octave_tex_tokentype octave_tex_token_kind_t;
#endif

/* Value type.  */
#if ! defined OCTAVE_TEX_STYPE && ! defined OCTAVE_TEX_STYPE_IS_DECLARED
union OCTAVE_TEX_STYPE
{
#line 65 "../libinterp/corefcn/oct-tex-parser.yy"

  // Leaf symbols produced by the scanner.
  char ch;
  double num;
  int sym;

  // Used for string buffering.
  std::string *str;

  // Objects produced by the parser.
  octave::text_element *e_base;
  octave::text_element_list *e_list;

#line 110 "libinterp/corefcn/oct-tex-parser.h"

};
typedef union OCTAVE_TEX_STYPE OCTAVE_TEX_STYPE;
# define OCTAVE_TEX_STYPE_IS_TRIVIAL 1
# define OCTAVE_TEX_STYPE_IS_DECLARED 1
#endif




int octave_tex_parse (octave::text_parser_tex& parser);


#endif /* !YY_OCTAVE_TEX_LIBINTERP_COREFCN_OCT_TEX_PARSER_H_INCLUDED  */
