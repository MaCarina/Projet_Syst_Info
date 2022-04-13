%{
#include "y.tab.h"
int index_lines = 1;
%}
%option noyywrap

%%
"int" {return tint;}
"const" {return tconst;}
"main()" {return tmain;}
"if" {return tif;}
"else" {return telse;}
"else if" {return telif;}
"{" {return taccoOuv;}
"}" {return taccoFerm;}
"+" {return tplus;}
"-" {return tmoins;}
"*" {return tfois;}
"/" {return tdiv;}
"=" {return tegal;}
"(" {return tparOuv;}
")" {return tparFerm;}
[ \t]+ {} /* {return tretour;} */
\n  {index_lines++;}
";" {return tpointvir;}/*{return tpointvir;}*/
"printf" {return tprintf;}
[e][-+]?[0-9]+ {yylval.nb=atof(yytext); return tnbExp;}
[0-9]+ {yylval.nb=atoi(yytext); return tnbDec;}
[a-zA-Z][a-z0-9A-Z_]* {strcpy(yylval.var, yytext);return tvar;}

%%