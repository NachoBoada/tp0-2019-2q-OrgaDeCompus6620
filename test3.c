#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<stdbool.h>

int main(int argc, const char* argv[]){

    char* puntero_acum;
    char x;
    while (*puntero_acum != EOF){
        puntero_acum ++;
        x = getc(stdin);
        *puntero_acum = x;
        printf("valor ingresado: %c",*puntero_acum);
    }
}
