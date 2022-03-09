%{
#include <stdlib.h>
#include <stdio.h>
int var[26];
%}
%union yylval {int nb; char * var;}
%token tint tconst tmain taccoOuv taccoFerm tplus tmoins tfois 
%token tdiv tegal tparOuv tparFerm tblanc tretour tpointvir tprintf tnbExp 
%token tnbDec tvar

%%

FICH : tmain taccoOuv {printf("tot\n");} MAIN taccoFerm {printf("main ici\n");}
    ;
MAIN : DECL_INT BODY {printf("declaration int ici\n");}
    |  PRINTF BODY {printf("declaration printf ici\n");}
    |  DECL_CONST BODY {printf("declaration const ici\n");}
    |
    ;

DECL_INT : tint  tvar { printf("regle decl \n");}
    |      tint  tvar tegal tnbDec { printf("regle decl2 \n");}
    |      tint  tvar tegal tnbExp { printf("regle decl3 \n");}
    ;
DECL_CONST : tconst tint tvar { printf("regle decl const \n");}
    |      tconst  tint tvar tegal tnbDec { printf("regle decl const2 \n");}
    |      tconst  tint tvar tegal tnbExp { printf("regle decl const3 \n");}
    ;
BODY : DECL_INT {printf("dans body decl int\n");}
    |  DECL_CONST {printf("dans body decl const\n");}
    |  PRINTF {printf("dans body printf\n");}
    |
    ;
PRINTF : tprintf tparOuv tvar tparFerm { printf("regle printf \n");}
       ;
TERME : tnbDec {printf("nombre decimal\n");}
    |   tnbExp {printf("nombre expo\n");}
    ;
ADD : TERME tplus TERME {printf("addition\n");}
    ;
SUB : TERME tmoins TERME {printf("soustraction\n");}
    ;
MUL : TERME tfois TERME {printf("multiplication\n");}
    ;
DIV : TERME tdiv TERME {printf("division\n");}
    ;

%%
int main(void) {
  yyparse();
  return 0;
}
int yyerror(void) 
   { printf("erreur\n");return 1;}