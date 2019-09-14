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

void raiseError(const char* s, bool *error){
    fprintf(stderr,"\n");
    fprintf(stderr,"=======================\n");
    fprintf(stderr,"ERROR MESSAGE: %s\n",s);
    fprintf(stderr,"=======================\n");
    fprintf(stderr,"\n");

    *error = true;
}

double* readInput(int* dimention, bool *error){

    float x;
    double y;
    double* array;
    int elementIndex;
    int returnValue;

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
            raiseError("Input no numerico",error);

            if (array != NULL){
                free(array);
            }
            break;
        }

        amountOfSuccesfullyReadInputs++;

        //ALLOCATE MEMORY FOR MATRICES INPUT ELEMENTS
        if (amountOfSuccesfullyReadInputs == 1){

            //CHECK IF INPUT IS TYPE UINT
            float mantiza = x - (int)x;
            if (mantiza > 0 || (x <= 0)){
                raiseError("La dimension no es entera positiva",error);
                break;
            }

            (*dimention) = (int)x;
            array = malloc(sizeof(double)*(*dimention)*(*dimention)*2);

            //CHECK IF ALLOCATION IS SUCCESSFULL
            if (array == NULL){
                raiseError("no se pudo allocar memoria para inputs",error);
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
    if (amountOfSuccesfullyReadInputs == 0 && !(*error)){
        raiseError("no se ingreso ningun valor",error);
    }
    //CHECK IF AMOUNT OF INPUTS IS CORRECT
    if (amountOfSuccesfullyReadInputs != (1 + (*dimention)*(*dimention)*2) && !(*error)){
        raiseError("no se respeto la cantidad de elementos prometidos",error);
        free(array);
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
        raiseError("no se pudo abrir archivo de salida",&r);
    }

    //OUTPUTS
    char c;
	while(c != EOF){
        c = getc(fp);
        fprintf(out,"%c",c);
	}
}

matrix_t* create_matrix(size_t rows, size_t cols, bool *error){
    matrix_t *matriz = malloc(sizeof(matrix_t));
    if (matriz == NULL){ //si no puede reservar la memoria, deja el puntero en NULL
        raiseError("no se pudo allocar memoria para matriz",error);
    }
    matriz->array = malloc(sizeof(double) * cols * rows); //representara los elementos de la matriz dispuestos en row-major order
    if (matriz->array == NULL){ //si no puede reservar la memoria, deja el puntero en NULL
        raiseError("no se pudo allocar memoria para elementos de matriz",error);
        free(matriz);
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
        printf("\naca bien: %g\n",input[i]);
        *(matrix_a->array + i) = input[i];
    }

    for (i = dimention*dimention; i < dimention*dimention*2; i++){
        matrix_b->array[i - dimention*dimention] = input[i];
    }
}

matrix_t* matrix_multiply(matrix_t* matrix_a,matrix_t* matrix_b, bool* error){

    int dimention = matrix_a->rows;

    matrix_t* matrix_c = create_matrix(dimention,dimention,error);

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

void print_matrix(FILE* out, matrix_t* matrix_m, bool* error){

    int dimention = matrix_m->rows;
    double x;
    int i;

    fprintf(out,"%g",x);
    fprintf(out,"%c",' ');

	for (i = 0; i < dimention; i++){
        x = matrix_m->array[i];
		fprintf(out,"%g",x);
        fprintf(out,"%c",' ');
	}
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

    //MAIN PROGRAM
    bool error = false;
    bool thereAreMoreProductsToDo = true;
    while (thereAreMoreProductsToDo && !endProgram){

        matrix_t* matrix_a;
        matrix_t* matrix_b;
        matrix_t* matrix_c;

        int dimention;
        double* input = readInput(&dimention,&error);

        if (!error){
            matrix_t* matrix_a = create_matrix(dimention,dimention,&error);
        }

        if (!error){
            matrix_t* matrix_b = create_matrix(dimention,dimention,&error);
        }

        if (!error){
            fillUpMatrices(matrix_a,matrix_b, dimention,input);
            matrix_t* matrix_c = matrix_multiply(matrix_a,matrix_b,&error);
        }
        printf("\nalala\n");
        /*
        int i;
        for (i = 0;i<4;i++){
            printf("elemento %d: %g\n",i,matrix_a->array[i]);
        }
        printf("\n%d\n",error);*/

        if (!error){
            print_matrix(OUT,matrix_c,&error);
        }

        if (error){
            endProgram = true;
        }

        destroy_matrix(matrix_a);
        destroy_matrix(matrix_b);
        destroy_matrix(matrix_c);
        free(input);
    }
    return 0;
}
