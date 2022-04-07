%{
#include <stdlib.h>
#include <stdio.h>
#include "ts.h"
#include "ti.h"
int var[26];
%}
%union yylval {int nb; char var[16];}
%token tint tconst tmain taccoOuv taccoFerm tplus tmoins tfois tif telse telif
%token tdiv tegal tparOuv tparFerm tblanc tretour tpointvir tprintf
%token <nb> tnbDec 
%token <nb> tnbExp
%token <var> tvar

%%

FICH : tmain taccoOuv BODY taccoFerm {printf("main ici\n");}
    ;

DECL_INT : tint  tvar { addts($2,"int");afficher();printf("decl_int\n");} // mettre dans la table des symboles
    |      tint  tvar tegal tnbDec { addts($2,"int");afficher();printf("decl_int 2\n");}
    |      tint  tvar tegal tnbExp { addts($2,"int");afficher();printf("decl_int 3\n");}
    ;
DECL_CONST : tconst tint tvar { addts($3,"int");afficher();printf("decl_const\n");}
    |      tconst  tint tvar tegal tnbDec { addts($3,"int");afficher();printf("decl_const 2\n");}
    |      tconst  tint tvar tegal tnbExp { addts($3,"int");afficher();printf("decl_const 3\n");}
    ;
BODY : DECL_INT BODY {printf("dans body decl int\n");}
    |  DECL_CONST BODY {printf("dans body decl const\n");}
    |  PRINTF BODY {printf("dans body printf\n");}
    |  CALCUL BODY {printf("declaration CALCUL ici\n");}
    |  IF BODY {printf("if ici\n");}
    |
    ;
CONDITION : tparOuv tvar tegal tegal tnbDec tparFerm {printf("condition if \n");}
    ;
IF :   tif CONDITION taccoOuv BODY taccoFerm BODY {printf("if simple \n");}
    |  tif CONDITION taccoOuv BODY taccoFerm ELSE {printf("if else \n");}
    |  tif CONDITION taccoOuv BODY taccoFerm ELIF {printf("if elif \n");}
    ;
ELSE : telse taccoOuv BODY taccoFerm BODY {printf("on est dans else\n");}
    ;
ELIF : telif CONDITION taccoOuv BODY taccoFerm ELIF {printf("on est dans un elif 1\n");}
    |  telif CONDITION taccoOuv BODY taccoFerm BODY {printf("on est dans un elif 2\n");}
    |  telif CONDITION taccoOuv BODY taccoFerm {printf("on est dans un elif 3\n");}
    |  telif CONDITION taccoOuv BODY taccoFerm ELSE {printf("on est dans un elif 4\n");}
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