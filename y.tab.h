/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
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
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tint = 258,
    tconst = 259,
    tmain = 260,
    taccoOuv = 261,
    taccoFerm = 262,
    tplus = 263,
    tmoins = 264,
    tfois = 265,
    tif = 266,
    telse = 267,
    telif = 268,
    tdiv = 269,
    tegal = 270,
    tparOuv = 271,
    tparFerm = 272,
    tblanc = 273,
    tretour = 274,
    tpointvir = 275,
    tprintf = 276,
    tnbDec = 277,
    tnbExp = 278,
    tvar = 279
  };
#endif
/* Tokens.  */
#define tint 258
#define tconst 259
#define tmain 260
#define taccoOuv 261
#define taccoFerm 262
#define tplus 263
#define tmoins 264
#define tfois 265
#define tif 266
#define telse 267
#define telif 268
#define tdiv 269
#define tegal 270
#define tparOuv 271
#define tparFerm 272
#define tblanc 273
#define tretour 274
#define tpointvir 275
#define tprintf 276
#define tnbDec 277
#define tnbExp 278
#define tvar 279

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
#line 8 "analexv2.y"
union yylval
{
#line 8 "analexv2.y"
int nb; char var[16];

#line 109 "y.tab.h"

};
#line 8 "analexv2.y"
typedef union yylval YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
