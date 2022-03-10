%{
#include "y.tab.h"
%}
%option noyywrap

%%
"int" {return tint;}
"const" {return tconst;}
"main()" {return tmain;}
"{" {return taccoOuv;}
"}" {return taccoFerm;}
"+" {return tplus;}
"-" {return tmoins;}
"*" {return tfois;}
"/" {return tdiv;}
"=" {return tegal;}
"(" {return tparOuv;}
")" {return tparFerm;}
[ \n\t]+ {} /* {return tretour;} */
";" {}/*{return tpointvir;}*/
"printf" {return tprintf;}
[e][-+]?[0-9]+ {yylval.nb=atof(yytext); return tnbExp;}
[0-9]+ {yylval.nb=atoi(yytext); return tnbDec;}
[a-zA-Z][a-z0-9A-Z_]* {strcpy(yylval.var, yytext);return tvar;}

%%