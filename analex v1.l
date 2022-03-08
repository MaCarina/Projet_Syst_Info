%option noyywrap

%%
int ECHO;
const ECHO;
"main()" {printf("main");}
"{" printf("acco_ouv");
"}" printf("acco_ferm");
"+" printf("plus");
"-" printf("moins");
"*" printf("fois");
"/" printf("div");
"=" printf("egal");
"(" printf("pare_ouv");
")" printf("pare_ferm");
[ \t]+ printf("blanc,espcae");
"\n" printf("retour");
";" printf("pointvir");
"printf" printf("fonction printf");
[e][-+]?[0-9]+ printf("nb_expo");
[0-9]+ printf("nb_dec");
[a-zA-Z][a-z0-9A-Z_]* printf("nom_var");

%%
main(){
    yylex();
    return 1;
}