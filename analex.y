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

FICH : tmain taccoOuv {printf("tot\n");} BODY taccoFerm {printf("main ici\n");}
    ;
// MAIN : DECL_INT BODY {printf("declaration int ici\n");}
//     |  PRINTF BODY {printf("declaration printf ici\n");}
//     |  DECL_CONST BODY {printf("declaration const ici\n");}
//     |  ADD BODY {printf("declaration ADD ici\n");}
//     |  SUB BODY {printf("declaration SUB ici\n");}
//     |  MUL BODY {printf("declaration MUL ici\n");}
//     |  DIV BODY {printf("declaration DIV ici\n");}
//     |
//     ;

DECL_INT : tint  tvar { addts($2,"int");afficher();} // mettre dans la table des symboles
    |      tint  tvar tegal tnbDec { addts($2,"int");afficher();} // { printf("regle decl2 %s %d \n", $2,$4);}
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
    // |  SUB BODY {printf("declaration SUB ici\n");}
    // |  MUL BODY {printf("declaration MUL ici\n");}
    // |  DIV BODY {printf("declaration DIV ici\n");}
    |
    ;
PRINTF : tprintf tparOuv tvar tparFerm { printf("regle printf \n");}
       ;
TERME : tnbDec {printf("nombre decimal\n");}
    |   tnbExp {printf("nombre expo\n");}
    ;
CALCUL : tvar tegal OPERATION {printf("calcul\n");}
    ;
ADD : TERME tplus TERME {printf("addition\n");}
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