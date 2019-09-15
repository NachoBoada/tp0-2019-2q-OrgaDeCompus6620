#include<stdio.h>
#include<stdbool.h>
#include<stdlib.h>

void raiseError(const char* s){
    fprintf(stderr,"\n");
    fprintf(stderr,"=======================\n");
    fprintf(stderr,"ERROR MESSAGE: %s\n",s);
    fprintf(stderr,"=======================\n");
    fprintf(stderr,"\n");
    exit (EXIT_FAILURE);
}

void readLine(int dimention,double* array){

    float x;
    double y;
    int returnValue;
    int amountOfSuccesfullyReadInputs = 0;
    do{
        if (amountOfSuccesfullyReadInputs > 0){
            y = (double)x;
            array[amountOfSuccesfullyReadInputs-1] = y;
        }
        returnValue = fscanf(stdin,"%g", &x);
        amountOfSuccesfullyReadInputs++;
    }
    while (returnValue != -1);
    amountOfSuccesfullyReadInputs--;
    //CHECK IF AMOUNT OF INPUTS IS CORRECT
    if (amountOfSuccesfullyReadInputs != dimention*dimention*2){
        raiseError("no se respeto la cantidad de elementos prometidos");
        free(array);
    }
}

double* readInput(int* dimention){

    float firstInputElement;//initialized as double to check if corrupted input
    double* array;
    int elementIndex;
    int returnValue;

    //READ FIRST
    returnValue = fscanf(stdin,"%g", &firstInputElement);

    //CHECK IF END OF LINE
    if (returnValue == -1){
        raiseError("no se ingreso ningun valor");
    }

    //CHECK IF INPUT IS NUMERIC
    if (returnValue != 1){
        raiseError("Input no numerico");
    }

    //CHECK IF INPUT IS TYPE UINT
    float mantiza = firstInputElement - (int)firstInputElement;
    if (mantiza > 0 || (firstInputElement <= 0)){
        raiseError("La dimension no es entera positiva");
    }

    //ALLOCATE MEMORY FOR MATRICES INPUT ELEMENTS
    (*dimention) = (int)firstInputElement;
    array = malloc(sizeof(double)*(*dimention)*(*dimention)*2);

    //CHECK IF ALLOCATION IS SUCCESSFULL
    if (array == NULL){
        raiseError("no se pudo allocar memoria para inputs");
    }

    //READ WHOLE LINE
    readLine((*dimention),array);
    return array;
}

int main(int argc, const char* argv[]){

    int dimention;
    double* input = readInput(&dimention);
    return 0;
}


