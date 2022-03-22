%{
#include <stdlib.h>
#include <stdio.h>
#include "ts.h"
#include "ti.h"
int var[26];
%}
%union yylval {int nb; char var[16];}
%token tint tconst tmain taccoOuv taccoFerm tplus tmoins tfois 
%token tdiv tegal tparOuv tparFerm tblanc tretour tpointvir tprintf
%token <nb> tnbDec 
%token <nb> tnbExp
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
TERME : tnbDec {addvarTemp($1); afficher();printf("nombre decimal\n");}
    |   tnbExp {addvarTemp($1); afficher();printf("nombre expo\n");}
    |   tvar {addts($1,"int");printf("nombre var\n");}
    ;
CALCUL : tvar tegal OPERATION {printf("calcul\n");}
    ;
ADD : TERME {printf("terme\n");} tplus {printf("plus\n");} TERME {addti("ADD"); afficherti();printf("addition\n");}
    ;
SUB : TERME tmoins TERME {addti("SUB");afficherti();printf("soustraction\n");}
    ;
MUL : TERME tfois TERME {addti("MUL");afficherti();printf("multiplication\n");}
    ;
DIV : TERME tdiv TERME {addti("DIV");afficherti();printf("division\n");}
    ;
OPERATION : ADD
    |       SUB
    |       MUL
    |       DIV
    ;

%%
int main(void) {
  yyparse();
  return 0;
}
int yyerror(void) 
   { printf("erreur\n");return 1;}