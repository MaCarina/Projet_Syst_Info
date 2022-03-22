#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char* var;
    int ind; //offset dans l'espace mem alloué au programme, pour trouver l'adresse
    char* type; 
    int prof; // taille de memoire, imbrication pour différencier les var avec même nom
} symbol;

void addts(char* var, char* type);
int searchind(char* var);
symbol getSymbol(int s);
int getIndexCourant();
void addvarTemp(int val);
void depileTS();
void afficher();