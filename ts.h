#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char* var;
    int ind; //offset dans l'espace mem alloué au programme, pour trouver l'adresse
    char* type; 
    int prof; // taille de memoire, imbrication pour différencier les var avec même nom
} symbol;

// void init();
void addts(char* var, char* type);
int searchind(char* var);
void afficher();