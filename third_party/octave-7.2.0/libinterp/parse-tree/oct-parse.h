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

#ifndef YY_OCTAVE_LIBINTERP_PARSE_TREE_OCT_PARSE_H_INCLUDED
# define YY_OCTAVE_LIBINTERP_PARSE_TREE_OCT_PARSE_H_INCLUDED
/* Debug traces.  */
#ifndef OCTAVE_DEBUG
# if defined YYDEBUG
#if YYDEBUG
#   define OCTAVE_DEBUG 1
#  else
#   define OCTAVE_DEBUG 0
#  endif
# else /* ! defined YYDEBUG */
#  define OCTAVE_DEBUG 0
# endif /* ! defined YYDEBUG */
#endif  /* ! defined OCTAVE_DEBUG */
#if OCTAVE_DEBUG
extern int octave_debug;
#endif

/* Token kinds.  */
#ifndef OCTAVE_TOKENTYPE
# define OCTAVE_TOKENTYPE
  enum octave_tokentype
  {
    OCTAVE_EMPTY = -2,
    OCTAVE_EOF = 0,                /* "end of file"  */
    OCTAVE_error = 256,            /* error  */
    OCTAVE_UNDEF = 257,            /* "invalid token"  */
    ADD_EQ = 258,                  /* ADD_EQ  */
    SUB_EQ = 259,                  /* SUB_EQ  */
    MUL_EQ = 260,                  /* MUL_EQ  */
    DIV_EQ = 261,                  /* DIV_EQ  */
    LEFTDIV_EQ = 262,              /* LEFTDIV_EQ  */
    POW_EQ = 263,                  /* POW_EQ  */
    EMUL_EQ = 264,                 /* EMUL_EQ  */
    EDIV_EQ = 265,                 /* EDIV_EQ  */
    ELEFTDIV_EQ = 266,             /* ELEFTDIV_EQ  */
    EPOW_EQ = 267,                 /* EPOW_EQ  */
    AND_EQ = 268,                  /* AND_EQ  */
    OR_EQ = 269,                   /* OR_EQ  */
    EXPR_AND_AND = 270,            /* EXPR_AND_AND  */
    EXPR_OR_OR = 271,              /* EXPR_OR_OR  */
    EXPR_AND = 272,                /* EXPR_AND  */
    EXPR_OR = 273,                 /* EXPR_OR  */
    EXPR_NOT = 274,                /* EXPR_NOT  */
    EXPR_LT = 275,                 /* EXPR_LT  */
    EXPR_LE = 276,                 /* EXPR_LE  */
    EXPR_EQ = 277,                 /* EXPR_EQ  */
    EXPR_NE = 278,                 /* EXPR_NE  */
    EXPR_GE = 279,                 /* EXPR_GE  */
    EXPR_GT = 280,                 /* EXPR_GT  */
    LEFTDIV = 281,                 /* LEFTDIV  */
    EMUL = 282,                    /* EMUL  */
    EDIV = 283,                    /* EDIV  */
    ELEFTDIV = 284,                /* ELEFTDIV  */
    HERMITIAN = 285,               /* HERMITIAN  */
    TRANSPOSE = 286,               /* TRANSPOSE  */
    PLUS_PLUS = 287,               /* PLUS_PLUS  */
    MINUS_MINUS = 288,             /* MINUS_MINUS  */
    POW = 289,                     /* POW  */
    EPOW = 290,                    /* EPOW  */
    NUMBER = 291,                  /* NUMBER  */
    STRUCT_ELT = 292,              /* STRUCT_ELT  */
    NAME = 293,                    /* NAME  */
    END = 294,                     /* END  */
    DQ_STRING = 295,               /* DQ_STRING  */
    SQ_STRING = 296,               /* SQ_STRING  */
    FOR = 297,                     /* FOR  */
    PARFOR = 298,                  /* PARFOR  */
    WHILE = 299,                   /* WHILE  */
    DO = 300,                      /* DO  */
    UNTIL = 301,                   /* UNTIL  */
    SPMD = 302,                    /* SPMD  */
    IF = 303,                      /* IF  */
    ELSEIF = 304,                  /* ELSEIF  */
    ELSE = 305,                    /* ELSE  */
    SWITCH = 306,                  /* SWITCH  */
    CASE = 307,                    /* CASE  */
    OTHERWISE = 308,               /* OTHERWISE  */
    BREAK = 309,                   /* BREAK  */
    CONTINUE = 310,                /* CONTINUE  */
    FUNC_RET = 311,                /* FUNC_RET  */
    UNWIND = 312,                  /* UNWIND  */
    CLEANUP = 313,                 /* CLEANUP  */
    TRY = 314,                     /* TRY  */
    CATCH = 315,                   /* CATCH  */
    GLOBAL = 316,                  /* GLOBAL  */
    PERSISTENT = 317,              /* PERSISTENT  */
    FCN_HANDLE = 318,              /* FCN_HANDLE  */
    CLASSDEF = 319,                /* CLASSDEF  */
    PROPERTIES = 320,              /* PROPERTIES  */
    METHODS = 321,                 /* METHODS  */
    EVENTS = 322,                  /* EVENTS  */
    ENUMERATION = 323,             /* ENUMERATION  */
    METAQUERY = 324,               /* METAQUERY  */
    SUPERCLASSREF = 325,           /* SUPERCLASSREF  */
    FQ_IDENT = 326,                /* FQ_IDENT  */
    GET = 327,                     /* GET  */
    SET = 328,                     /* SET  */
    FCN = 329,                     /* FCN  */
    ARGUMENTS = 330,               /* ARGUMENTS  */
    LEXICAL_ERROR = 331,           /* LEXICAL_ERROR  */
    END_OF_INPUT = 332,            /* END_OF_INPUT  */
    INPUT_FILE = 333,              /* INPUT_FILE  */
    UNARY = 334                    /* UNARY  */
  };
  typedef enum octave_tokentype octave_token_kind_t;
#endif

/* Value type.  */
#if ! defined OCTAVE_STYPE && ! defined OCTAVE_STYPE_IS_DECLARED
union OCTAVE_STYPE
{
#line 139 "../libinterp/parse-tree/oct-parse.yy"

  int dummy_type;

  // The type of the basic tokens returned by the lexer.
  octave::token *tok_val;

  // Comment strings that we need to deal with mid-rule.
  octave::comment_list *comment_type;

  // Types for the nonterminals we generate.
  char punct_type;
  octave::tree *tree_type;
  octave::tree_matrix *tree_matrix_type;
  octave::tree_cell *tree_cell_type;
  octave::tree_expression *tree_expression_type;
  octave::tree_constant *tree_constant_type;
  octave::tree_fcn_handle *tree_fcn_handle_type;
  octave::tree_superclass_ref *tree_superclass_ref_type;
  octave::tree_metaclass_query *tree_metaclass_query_type;
  octave::tree_function_def *tree_function_def_type;
  octave::tree_anon_fcn_handle *tree_anon_fcn_handle_type;
  octave::tree_identifier *tree_identifier_type;
  octave::tree_index_expression *tree_index_expression_type;
  octave::tree_colon_expression *tree_colon_expression_type;
  octave::tree_argument_list *tree_argument_list_type;
  octave::tree_parameter_list *tree_parameter_list_type;
  octave::tree_command *tree_command_type;
  octave::tree_if_command *tree_if_command_type;
  octave::tree_if_clause *tree_if_clause_type;
  octave::tree_if_command_list *tree_if_command_list_type;
  octave::tree_switch_command *tree_switch_command_type;
  octave::tree_switch_case *tree_switch_case_type;
  octave::tree_switch_case_list *tree_switch_case_list_type;
  octave::tree_decl_elt *tree_decl_elt_type;
  octave::tree_decl_init_list *tree_decl_init_list_type;
  octave::tree_decl_command *tree_decl_command_type;
  octave::tree_statement *tree_statement_type;
  octave::tree_statement_list *tree_statement_list_type;
  octave::tree_arguments_block *tree_arguments_block_type;
  octave::tree_args_block_attribute_list *tree_args_block_attribute_list_type;
  octave::tree_args_block_validation_list *tree_args_block_validation_list_type;
  octave::tree_arg_size_spec *tree_arg_size_spec_type;
  octave::tree_arg_validation *tree_arg_validation_type;
  octave::tree_arg_validation_fcns *tree_arg_validation_fcns_type;
  octave_user_function *octave_user_function_type;

  octave::tree_classdef *tree_classdef_type;
  octave::tree_classdef_attribute* tree_classdef_attribute_type;
  octave::tree_classdef_attribute_list* tree_classdef_attribute_list_type;
  octave::tree_classdef_superclass* tree_classdef_superclass_type;
  octave::tree_classdef_superclass_list* tree_classdef_superclass_list_type;
  octave::tree_classdef_body* tree_classdef_body_type;
  octave::tree_classdef_property* tree_classdef_property_type;
  octave::tree_classdef_property_list* tree_classdef_property_list_type;
  octave::tree_classdef_properties_block* tree_classdef_properties_block_type;
  octave::tree_classdef_methods_list* tree_classdef_methods_list_type;
  octave::tree_classdef_methods_block* tree_classdef_methods_block_type;
  octave::tree_classdef_event* tree_classdef_event_type;
  octave::tree_classdef_events_list* tree_classdef_events_list_type;
  octave::tree_classdef_events_block* tree_classdef_events_block_type;
  octave::tree_classdef_enum* tree_classdef_enum_type;
  octave::tree_classdef_enum_list* tree_classdef_enum_list_type;
  octave::tree_classdef_enum_block* tree_classdef_enum_block_type;

#line 216 "libinterp/parse-tree/oct-parse.h"

};
typedef union OCTAVE_STYPE OCTAVE_STYPE;
# define OCTAVE_STYPE_IS_TRIVIAL 1
# define OCTAVE_STYPE_IS_DECLARED 1
#endif




#ifndef YYPUSH_MORE_DEFINED
# define YYPUSH_MORE_DEFINED
enum { YYPUSH_MORE = 4 };
#endif

typedef struct octave_pstate octave_pstate;


int octave_parse (octave::base_parser& parser);
int octave_push_parse (octave_pstate *ps,
                  int pushed_char, OCTAVE_STYPE const *pushed_val, octave::base_parser& parser);
int octave_pull_parse (octave_pstate *ps, octave::base_parser& parser);
octave_pstate *octave_pstate_new (void);
void octave_pstate_delete (octave_pstate *ps);


#endif /* !YY_OCTAVE_LIBINTERP_PARSE_TREE_OCT_PARSE_H_INCLUDED  */
