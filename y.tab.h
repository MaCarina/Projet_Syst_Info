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
    tdiv = 266,
    tegal = 267,
    tparOuv = 268,
    tparFerm = 269,
    tblanc = 270,
    tretour = 271,
    tpointvir = 272,
    tprintf = 273,
    tnbExp = 274,
    tnbDec = 275,
    tvar = 276
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
#define tdiv 266
#define tegal 267
#define tparOuv 268
#define tparFerm 269
#define tblanc 270
#define tretour 271
#define tpointvir 272
#define tprintf 273
#define tnbExp 274
#define tnbDec 275
#define tvar 276

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
#line 6 "analex.y"
union yylval
{
#line 6 "analex.y"
int nb; char * var;

#line 103 "y.tab.h"

};
#line 6 "analex.y"
typedef union yylval YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
