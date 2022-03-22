#include "ts.h"

#include <string.h>

// #include <string.h>

// #define COMPTEUR 0
#define LENGTH_TAB 100

symbol tss[LENGTH_TAB] ;
int compteur = 0;

void addts(char* var, char* type){
    //printf("%d\n\n", searchind(var));
    if (searchind(var) == -1){
        symbol newSymbol;
        newSymbol.var = strdup(var); 
        newSymbol.type = strdup(type); 
        newSymbol.ind = compteur;
        compteur++;
        newSymbol.prof = 0;
        tss[newSymbol.ind] = newSymbol;
        //printf("ajouté dans le tableau avec indice : %d\n", newSymbol.ind);
    }
    else {
        //printf("Exists already\n");
    }
}

int searchind(char* var){
    for(int i = 0; i< compteur; i++){
        //printf("var: %s \n tabVar: %s\n", var, ts[i].var);
        if (!strcmp(tss[i].var, var)){ // strcmp retourne 0 si egaux
            return tss[i].ind;
        }
    }
    return -1;
}

symbol getSymbol(int s){
    return tss[s];
}

int getIndexCourant() {
    return compteur;
}

void addvarTemp(){
    symbol newSymbol;
    sprintf(newSymbol.var,"%d",val); 
    newSymbol.var = "";
    printf("%d %s\n", val,newSymbol.var);
    newSymbol.type = "varTemp"; 
    newSymbol.ind = compteur;
    newSymbol.prof = 0;
    compteur++;
    tss[newSymbol.ind]=newSymbol;
    //ecrire la valeur à l'adresse
}

void depileTS(){
    tss[compteur].var = NULL; 
    tss[compteur].type = NULL; 
    tss[compteur].ind = 0;
    tss[compteur].prof = 0;
    compteur --;
}

void afficher(){
    for (int i = 0; i < 30-1; i++) {
        printf("-");
    }
    printf("\n");
    for(int i = 0; i < compteur; i++){
        printf("| @%02i | %8s | %8s |\n", i, tss[i].var, tss[i].type);
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