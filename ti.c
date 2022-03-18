#include "ts.h"

#include <string.h>

#define LENGTH_TAB 100

instru ti[LENGTH_TAB] ;
int index = 0;

void addti(char* type){
    //printf("%d\n\n", searchind(var));
    instru newInstru;
    newInstru.ins = strdup(type); 
    newInstru.ope1 = (&ts + ts[compteur].ind); 
    newInstru.ope2 = ;
    newInstru.ope3 = ;
    ti[index] = newInstru;
    index++;
    //printf("ajouté dans le tableau avec indice : %d\n", newSymbol.ind);
}

void afficherti(){
    for (int i = 0; i < 30-1; i++) {
        printf("-");
    }
    printf("\n");
    for(int i = 0; i < compteur; i++){
        printf("| @%02i | %8s | %8s |\n", i, ti[i].var, ti[i].type);
    }
    for (int i = 0; i < 30-1; i++) {
        printf("-");
    }
    printf("\n");
    printf("\n");
}
/*
int main(int argc, char *argv[]){
    // init();
    //afficher();
    addts("a", "int");
    addts("a", "int");
    addts("a", "int");
    addts("a", "int");
    addts("a", "int");
    addts("b", "int");
    addts("c", "int");
    afficher();
    return 0;
    //dépiler de la table les var quand on voit }, seulement celle de la bonne prof
}*/