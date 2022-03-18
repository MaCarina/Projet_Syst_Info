#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char* ins;
    int ope1;
    int ope2;
    int ope3;
} instru;

void addti(char* type);
void afficherti();