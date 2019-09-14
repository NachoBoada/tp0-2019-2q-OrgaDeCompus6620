#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<stdbool.h>
#include "Tp0.h"

typedef struct matrix {
    size_t rows;
    size_t cols;
    double* array;
}matrix_t;

void raiseError(const char* s){
    fprintf(stderr,"\n");
    fprintf(stderr,"=======================\n");
    fprintf(stderr,"ERROR MESSAGE: %s\n",s);
    fprintf(stderr,"=======================\n");
}

double* readInput(int* dimention){

    float x;
    double y;
    double* array;
    int elementIndex;
    int returnValue;

    bool error = false;

    int amountOfSuccesfullyReadInputs = 0;
    bool endOfLine = false;
    while (!endOfLine){
        //READ
        returnValue = fscanf(stdin,"%g", &x);

        //CHECK IF END OF LINE
        if (returnValue == -1){
            endOfLine = true;
            break;
        }

        //CHECK IF INPUT IS NUMERIC
        if (returnValue != 1){
            raiseError("Input no numerico");

            if (array != NULL){
                free(array);
            }
            error = true;
            break;
        }

        amountOfSuccesfullyReadInputs++;

        //ALLOCATE MEMORY FOR MATRICES INPUT ELEMENTS
        if (amountOfSuccesfullyReadInputs == 1){

            //CHECK IF INPUT IS TYPE UINT
            float mantiza = x - (int)x;
            if (mantiza > 0 || (x <= 0)){
                raiseError("La dimension no es entera positiva");
                error = true;
                break;
            }

            (*dimention) = (int)x;
            array = malloc(sizeof(double)*(*dimention)*(*dimention)*2);

            //CHECK IF ALLOCATION IS SUCCESSFULL
            if (array == NULL){
                raiseError("no se pudo allocar memoria para inputs");
                error = true;
                break;
            }
        }

        //ADD ELEMENT TO ARRAY
        else{
            y = (double)x;
            elementIndex = amountOfSuccesfullyReadInputs - 2;
            array[elementIndex] = y;
        }
    }
    //CHECK IF EMPTY INPUT
    if (amountOfSuccesfullyReadInputs == 0 && !error){
        raiseError("no se ingreso ningun valor");
        error = true;
    }
    //CHECK IF AMOUNT OF INPUTS IS CORRECT
    if (amountOfSuccesfullyReadInputs != (1 + (*dimention)*(*dimention)*2) && !error){
        raiseError("no se respeto la cantidad de elementos prometidos");
        free(array);
        error = true;
    }
    return array;
}

void outputFile(FILE* out, char fileName[]){
    //ADAPTS FILE NAME
    char s[100];
    strcat(s, "./");
    strcat(s, fileName);

    //TRIES TO OPEN FILE
    FILE* fp;
    fp = fopen(s,"r");
    if(fp == NULL){
        raiseError("no se pudo abrir archivo de salida");
    }

    //OUTPUTS
    char c;
	do
    {
        c = getc(fp);
		fprintf(out,"%c",c);
	}
	while(c != EOF);
}

matrix_t* create_matrix(size_t rows, size_t cols){
    matrix_t *matriz = malloc(sizeof(matrix_t));
    if (matriz == NULL){ //si no puede reservar la memoria, deja el puntero en NULL
        raiseError("no se pudo allocar memoria para matriz");
    }
    matriz->array = malloc(sizeof(size_t) * cols * rows); //representara los elementos de la matriz dispuestos en row-major order
    if (matriz->array == NULL){ //si no puede reservar la memoria, deja el puntero en NULL
        free(matriz);
        raiseError("no se pudo allocar memoria para elementos de matriz");
    }
    matriz->rows = rows;
    matriz->cols = cols;
    return matriz;
}

void destroy_matrix(matrix_t* m){
    free(m->array);
    free(m);
}

void fillUpMatrices(matrix_t* matrix_a, matrix_t* matrix_b, int dimention,double* input){

    int i;

    for (i = 0; i < dimention*dimention; i++){
        matrix_a->array[i] = input[i];
    }

    for (i = dimention*dimention; i < dimention*dimention*2; i++){
        matrix_b->array[i] = input[i];
    }
}

matrix_t* matrix_multiply(matrix_t* matrix_a,matrix_t* matrix_b){

void print_matrix(FILE* fp, matrix_t* matrix_m){

}

    int dimention = matrix_a->rows;

    matrix_t* matrix_c = create_matrix(dimention,dimention);

    int row;
    int column;
    int i;
    int j;
    int element;

    for (i = 0; i < dimention; i++){

        row = (int)(i / dimention);
        column = (int)(i % dimention);

        element = 0;
        for (j = 0; j < dimention; j++){

            element += matrix_a->array[row*dimention + j] * matrix_b->array[j*dimention + column];
        }
        matrix_c->array[i] = element;
    }
    return matrix_c;
}

int main(int argc, const char* argv[]){

    //INITIALIZATION
    FILE* OUT = stdout;

    //HANDELING COMANDS
    int a = 1; //COMENTARIO PARA NOSOTROS: Por alguna razon si no pongo a y pongo 1 en vez no anda

    if (strcmp(argv[a],"-h") == 0 || strcmp(argv[a],"--help") == 0){
        char fileName[] = "help";
        outputFile(OUT,fileName);
    }

    if (strcmp(argv[a],"-V") == 0 || strcmp(argv[a],"--version") == 0){
        char fileName[] = "version";
        outputFile(OUT,fileName);
    }

    //MAIN PROGRAM
    bool error = false; //VER COMO  CORTAR LA EJECUCION DE FORMA ELEGANTE
    bool thereAreMoreProductsToDo = true;
    while (thereAreMoreProductsToDo){

        int dimention;
        double* input = readInput(&dimention);

        matrix_t* matrix_a = create_matrix(dimention,dimention);
        matrix_t* matrix_b = create_matrix(dimention,dimention);

        fillUpMatrices(matrix_a,matrix_b, dimention,input);

        matrix_t* matrix_c = matrix_multiply(matrix_a,matrix_b);

        print_matrix(OUT,matrix_c);

        destroy_matrix(matrix_a);
        destroy_matrix(matrix_b);
        destroy_matrix(matrix_c);
    }
    return 0;
}
