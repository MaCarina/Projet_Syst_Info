#include "ts.h"
#include "ti.h"

#include <string.h>

#define LENGTH_TAB 100

instru tii[LENGTH_TAB] ;
int indice = 0;

void addti(char* type){
    //printf("%d\n\n", searchind(var));
    instru newInstru;
    newInstru.ins = strdup(type); 
    //récupérer les var au sommet de la table des symboles
    newInstru.ope1 = getSymbol(getIndexCourant()-1).ind;
    depileTS();
    newInstru.ope2 = getSymbol(getIndexCourant()-1).ind;
    depileTS();
    newInstru.ope3 = getSymbol(getIndexCourant()-1).ind;
    depileTS();
    tii[indice] = newInstru;
    indice++;
    printf("ajouté dans le tableau : %s\n", newInstru.ins);
}

void afficherti(){
    for (int i = 0; i < 52-1; i++) {
        printf("-");
    }
    printf("\n");
    for(int i = 0; i < indice; i++){
        printf("| @%02i | %8s | %8i | %8i | %8i |\n", i, tii[i].ins, tii[i].ope1,tii[i].ope2,tii[i].ope3);
    }
    for (int i = 0; i < 52-1; i++) {
        printf("-");
    }
    printf("\n");
    printf("\n");
}
/*
int main(int argc, char *argv[]){
    // init();
    afficherti();
    addts("a", "int");
    addts("a", "int");
    addts("a", "int");
    addts("a", "int");
    addts("a", "int");
    addts("b", "int");
    addts("c", "int");
    afficher();
    addti("MUL");
    afficher();
    afficherti();
    return 0;
    //dépiler de la table les var quand on voit }, seulement celle de la bonne prof
}*/