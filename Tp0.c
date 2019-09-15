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
    fprintf(stderr,"\n");
    exit (EXIT_FAILURE);
}

double* readInput(int* dimention, bool* thereAreMoreProductsToDo){

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

            //CHECK IF EMPTY INPUT
            if (amountOfSuccesfullyReadInputs == 0 && !error){
                raiseError("no se ingreso ningun valor");
                error = true;
            }

            //CHECK IF AMOUNT OF INPUTS IS CORRECT
            if (amountOfSuccesfullyReadInputs != (1 + (*dimention)*(*dimention)*2) && !error){
                raiseError("no se respeto la cantidad de elementos prometidos");
                error = true;
            }
            break;
        }

        //CHECK IF INPUT IS NUMERIC
        if (returnValue != 1){
            raiseError("Input no numerico");
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
    return array;
}

void outputFile(FILE* out, char fileName[]){
    //ADAPTS FILE NAME
    char s[100] = "";
    strcat(s, "./");
    strcat(s, fileName);

    //TRIES TO OPEN FILE
    bool r; //A FIX
    FILE* fp;
    fp = fopen(s,"r");
    if(fp == NULL){
        raiseError("no se pudo abrir archivo de salida");
    }

    //OUTPUTS
    char c;
	while(c != EOF){
        c = getc(fp);
        fprintf(out,"%c",c);
	}
}

matrix_t* create_matrix(size_t rows, size_t cols){
    matrix_t *matriz = malloc(sizeof(matrix_t));
    if (matriz == NULL){ //si no puede reservar la memoria, deja el puntero en NULL
        raiseError("no se pudo allocar memoria para matriz");
    }
    matriz->array = malloc(sizeof(double) * cols * rows); //representara los elementos de la matriz dispuestos en row-major order
    if (matriz->array == NULL){ //si no puede reservar la memoria, deja el puntero en NULL
        raiseError("no se pudo allocar memoria para elementos de matriz");
        free(matriz);
    }
    matriz->rows = rows;
    matriz->cols = cols;
    return matriz;
}

void destroy_matrix(matrix_t* m){

    if (m != NULL){
        free(m->array);
        free(m);
    }
}

void fillUpMatrices(matrix_t* matrix_a, matrix_t* matrix_b, int dimention,double* input){

    int i;
    for (i = 0; i < dimention*dimention; i++){
        matrix_a->array[i] = input[i];
    }

    for (i = dimention*dimention; i < dimention*dimention*2; i++){
        matrix_b->array[i - dimention*dimention] = input[i];
    }
}

matrix_t* matrix_multiply(matrix_t* matrix_a,matrix_t* matrix_b){

    int dimention = matrix_a->rows;

    matrix_t* matrix_c = create_matrix(dimention,dimention);

    int row;
    int column;
    int i;
    int j;
    int element;

    for (i = 0; i < dimention*dimention; i++){

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

void print_matrix(FILE* out, matrix_t* matrix_m){

    int dimention = matrix_m->rows;
    double x;
    int i;

    fprintf(out,"%d",dimention);
    fprintf(out,"%c",' ');

	for (i = 0; i < dimention*dimention; i++){
        x = matrix_m->array[i];
		fprintf(out,"%g",x);
        fprintf(out,"%c",' ');
	}
    fprintf(out,"\n");
}

int main(int argc, const char* argv[]){

    //INITIALIZATION
    FILE* OUT = stdout;
    bool endProgram = false;

    //HANDELING COMANDS
    if (argc > 1){
        if (strcmp(argv[1],"-h") == 0 || strcmp(argv[1],"--help") == 0){
            char fileName[] = "help";
            outputFile(OUT,fileName);
            endProgram = true;
        }

        if (strcmp(argv[1],"-V") == 0 || strcmp(argv[1],"--version") == 0){
            char fileName[] = "version";
            outputFile(OUT,fileName);
            endProgram = true;
        }
    }

    void printArray(double a[],int len){
        int i;
        for (i = 0; i < len; i++){
            printf("element: %g\n",a[i]);
        }
    }

    //MAIN PROGRAM
    bool thereAreMoreProductsToDo = true;
    while (thereAreMoreProductsToDo && !endProgram){

        matrix_t* matrix_a;
        matrix_t* matrix_b;
        matrix_t* matrix_c;

        int dimention;
        double* input = readInput(&dimention,&thereAreMoreProductsToDo);
        //printArray(input,dimention*dimention*2);
        //printf("readInput: \n");
        matrix_a = create_matrix(dimention,dimention);
        //printf("matrix_a = create_matrix: \n");
        matrix_b = create_matrix(dimention,dimention);
        //printf("matrix_b = create_matrix: \n");
        fillUpMatrices(matrix_a,matrix_b, dimention,input);
        //printf("fillUpMatrices: \n");
        matrix_c = matrix_multiply(matrix_a,matrix_b);
        //printf("matrix_multiply: \n");
        print_matrix(OUT,matrix_c);
        //printArray(matrix_c->array,dimention*dimention);

        destroy_matrix(matrix_a);
        //printf("destroy_matrix(matrix_a): \n");
        destroy_matrix(matrix_b);
        //printf("destroy_matrix(matrix_b): \n");
        destroy_matrix(matrix_c);
        //printf("destroy_matrix(matrix_c): \n");
        /*
        if (input != NULL){
            free(input);
        }*/
    }
    return 0;
}
