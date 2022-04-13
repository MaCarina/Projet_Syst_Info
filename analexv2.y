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

DECL_INT : tint  tvar tpointvir { addts($2,"int");afficher();printf("decl_int\n");} // mettre dans la table des symboles
    |      tint  tvar tegal tnbDec tpointvir { addts($2,"int");afficher();printf("decl_int 2\n");}
    |      tint  tvar tegal tnbExp tpointvir { addts($2,"int");afficher();printf("decl_int 3\n");}
    ;
DECL_CONST : tconst tint tvar tpointvir { addts($3,"int");afficher();printf("decl_const\n");}
    |      tconst  tint tvar tegal tnbDec tpointvir { addts($3,"int");afficher();printf("decl_const 2\n");}
    |      tconst  tint tvar tegal tnbExp tpointvir { addts($3,"int");afficher();printf("decl_const 3\n");}
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
IF :   tif CONDITION taccoOuv BODY taccoFerm {printf("if simple \n");}
    |  tif CONDITION taccoOuv BODY taccoFerm ELSE {printf("if else \n");}
    |  tif CONDITION taccoOuv BODY taccoFerm ELIF {printf("if elif \n");}
    ;
ELSE : telse taccoOuv BODY taccoFerm {printf("on est dans else\n");}
    ;
ELIF : telif CONDITION taccoOuv BODY taccoFerm ELIF {printf("on est dans un elif 1\n");}
    |  telif CONDITION taccoOuv BODY taccoFerm {printf("on est dans un elif 2\n");}
    |  telif CONDITION taccoOuv BODY taccoFerm ELSE {printf("on est dans un elif 4\n");}
    ;
PRINTF : tprintf tparOuv tvar tparFerm tpointvir { printf("regle printf \n");}
       ;
TERME : tnbDec {printf("chiffre :%d\n",$1);addvarTemp($1); afficher();printf("nombre decimal\n");}
    |   tnbExp {addvarTemp($1); afficher();printf("nombre expo\n");}
    |   tvar {addts($1,"int");printf("nombre var\n");}
    ;
CALCUL : tvar tegal OPERATION tpointvir {printf("calcul\n");}
    ;

OPERATION : TERME tmoins TERME {printf("OPERATION 1\n");}
    |       TERME {printf("stp\n");} tplus {printf("plus\n");} TERME {printf("OPERATION 2\n");}
    |       tnbDec {printf("OPERATION 3\n");}
    |       tvar {printf("OPERATION 4\n");}
    ;

%%
int main(void) {
    yydebug = 0;
  yyparse();
  return 0;
}
int yyerror(char *s) 
   { extern int index_lines;
   printf("erreur: @%d: %s\n", index_lines, s);return 1;}