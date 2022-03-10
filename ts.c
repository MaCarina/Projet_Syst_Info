#include "ts.h"

#include <string.h>

// #include <string.h>

// #define COMPTEUR 0
#define LENGTH_TAB 100

symbol ts[LENGTH_TAB] ;
int compteur = 0;

// struct symbol* ts[LENGTH_TAB];
// int* compteur = 0;

// void init(){
//     for (int i=0;i<LENGTH_TAB;i++){
//         ts[i]=NULL;
//     }
// }

void addts(char* var, char* type){
    printf("%d\n\n", searchind(var));
    if (searchind(var) == -1){
        symbol newSymbol;
        newSymbol.var = strdup(var); 
        newSymbol.type = strdup(type); 
        newSymbol.ind = compteur;
        compteur++;
        newSymbol.prof = 0;
        ts[newSymbol.ind] = newSymbol;
        printf("ajouté dans le tableau avec indice : %d\n", newSymbol.ind);
    }
    else {
        printf("Exists already\n");
    }
}

int searchind(char* var){
    for(int i = 0; i< compteur; i++){
        printf("var: %s \n tabVar: %s\n", var, ts[i].var);
        if (!strcmp(ts[i].var, var)){ // strcmp retourne 0 si egaux
            return ts[i].ind;
        }
    }
    return -1;
}

void afficher(){
    for (int i = 0; i < 30-1; i++) {
        printf("-");
    }
    printf("\n");
    for(int i = 0; i < compteur; i++){
        printf("| @%02i | %8s | %8s |\n", i, ts[i].var, ts[i].type);
    }
    for (int i = 0; i < 30-1; i++) {
        printf("-");
    }
    printf("\n");
    printf("\n");
}

int main(int argc, char *argv[]){
    // init();
    afficher();
    addts("a", "int");
    addts("a", "int");
    addts("a", "int");
    addts("a", "int");
    addts("a", "int");
    addts("b", "int");
    afficher();
    return 0;
}