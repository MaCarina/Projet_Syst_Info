%{
#include <stdlib.h>
#include <stdio.h>
#include "ts.c"
int var[26];
%}
%union yylval {int nb; char var[16];}
%token tint tconst tmain taccoOuv taccoFerm tplus tmoins tfois 
%token tdiv tegal tparOuv tparFerm tblanc tretour tpointvir tprintf tnbExp 
%token <nb> tnbDec
%token <var> tvar

%%

FICH : tmain taccoOuv BODY taccoFerm {printf("main ici\n");}
    ;

DECL_INT : tint  tvar { addts($2,"int");afficher();} // mettre dans la table des symboles
    |      tint  tvar tegal tnbDec { addts($2,"int");afficher();}
    |      tint  tvar tegal tnbExp { addts($2,"int");afficher();}
    ;
DECL_CONST : tconst tint tvar { addts($3,"int");afficher();}
    |      tconst  tint tvar tegal tnbDec { addts($3,"int");afficher();}
    |      tconst  tint tvar tegal tnbExp { addts($3,"int");afficher();}
    ;
BODY : DECL_INT BODY {printf("dans body decl int\n");}
    |  DECL_CONST BODY {printf("dans body decl const\n");}
    |  PRINTF BODY {printf("dans body printf\n");}
    |  CALCUL BODY {printf("declaration CALCUL ici\n");}
    |
    ;
PRINTF : tprintf tparOuv tvar tparFerm { printf("regle printf \n");}
       ;
TERME : tnbDec {printf("nombre decimal\n");}
    |   tnbExp {printf("nombre expo\n");}
    |   tvar {printf("nombre var\n");}
    ;
CALCUL : tvar tegal OPERATION {printf("calcul\n");}
    ;
ADD : TERME tplus TERME {ADD $1 $3 $1; printf("addition\n");}
    ;
SUB : TERME tmoins TERME {printf("soustraction\n");}
    ;
MUL : TERME tfois TERME {printf("multiplication\n");}
    ;
DIV : TERME tdiv TERME {printf("division\n");}
    ;
OPERATION : ADD
    |       SUB
    |       MUL
    |       DIV
    |       TERME
    ;

%%
int main(void) {
  yyparse();
  return 0;
}
int yyerror(void) 
   { printf("erreur\n");return 1;}