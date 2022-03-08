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

FICH : tmain taccoOuv {printf("tot\n");} MAIN taccoFerm 
            {printf("main ici\n");}
     ;
MAIN : DECL_INT BODY 
         {printf("declaration int ici\n");}
    |  PRINTF BODY
        {printf("declaration printf ici\n");}
    |
     ;

DECL_INT : tint  tvar tpointvir
          { printf("regle decl \n");}
    |       tint  tvar tegal tnbDec tpointvir { printf("regle decl2 \n");}
    |       tint  tvar tegal tnbExp tpointvir { printf("regle decl3 \n");}
        ;
BODY : DECL_INT
     | PRINTF
     |
     ;

PRINTF : tprintf tparOuv tvar tparFerm tpointvir { printf("regle printf \n");}
       ;
/* ADD : terme tplus terme {printf("addition\n");}
terme : tnbDec
    |   tnbExp
*/

%%
int main(void) {
  yyparse();
  return 0;
}
int yyerror(void) 
   { printf("erreur\n");return 1;}