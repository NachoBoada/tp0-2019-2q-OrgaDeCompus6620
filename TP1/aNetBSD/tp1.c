#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<stdbool.h>
#include "mymalloc.h"

typedef struct matrix {
    size_t rows;
    size_t cols;
    double* array;
} matrix_t;


void printArray(int len,double* array){
    int i;
    for(i=0;i<len;i++){
        printf("elemento %d: %g\n", i, array[i]);
    }
}

void destroy_matrix(matrix_t* m){
    if (m != NULL){
        myfree(m->array);
        myfree(m);
    }
}

void raiseError(const char* s){

    fprintf(stderr,"\n");
    fprintf(stderr,"=======================\n");
    fprintf(stderr,"ERROR MESSAGE: %s\n",s);
    fprintf(stderr,"=======================\n");
    fprintf(stderr,"\n");
}

char *readLine(FILE* fp, double* array){
//The size is extended by the input with the value of the provisional
    int size = 10; //HARDCODED
    char *str = NULL;
    char *errorReturnValue = NULL;
    int ch;
    size_t len = 0;


    str = realloc(NULL, sizeof(char)*size);//size is start size
    if(str == NULL){
        free(array);
        raiseError("REALLOC ERROR: null pointer returned");
        return errorReturnValue;
    }
    else{
        while(EOF!=(ch=fgetc(fp)) && ch != '\n'){
            str[len++]=ch;
            if(len==size){

                str = realloc(str, sizeof(char)*(size+=16)); //HARDCODED
                if(str == NULL){
                    free(str);
                    free(array);
                    raiseError("REALLOC ERROR: null pointer returned");
                    return errorReturnValue;
                }
            }
        }
    }

    if (ferror(stdin) != 0){
        free(str);
        free(array);
        raiseError("FGETC ERROR: I/O error");
        return errorReturnValue;
    }

    str[len++]='\0';

    str = realloc(str, sizeof(char)*len);
    if (str == NULL){
        free(str);
        free(array);
        raiseError("REALLOC ERROR: null pointer returned");
        return errorReturnValue;
    }

    return str;
}

int readElementsInLine(int dimention, double* array){

    char* line = readLine(stdin, array); //line has all the characters of the current line in stdin.
    char* head_line_pointer = line;

    float x;
    int offset;
    int i = 0;
    int returnValue;
    int cantidadDeElementosLeidos = 0;
    int errorReturnValue = 1;

    while (true)
    {
        returnValue = sscanf(head_line_pointer, "%g%n", &x, &offset);

        if (ferror(stdin) != 0){
            free(array);
            free(line);
            raiseError("SSCANF ERROR: I/O error");
            return errorReturnValue;
        }

        if (returnValue == 1){
            head_line_pointer += offset;
            array[i] = (double)x;
            i++;
			if (i > dimention*dimention*2){
                free(array);
                free(line);
				raiseError("La cantidad de numeros es mayor a lo especificado segun la dimension");
				return errorReturnValue;
			}
            continue;
        }

        if (returnValue == -1){
            cantidadDeElementosLeidos = i;
            if(cantidadDeElementosLeidos != dimention*dimention*2){
                free(array);
                free(line);
                raiseError("La cantidad de numeros es menor a lo especificado segun la dimension");
                return errorReturnValue;
            }
            break;
        }

        if (returnValue != 1){
            free(array);
            free(line);
            raiseError("Input no numerico");
            return errorReturnValue;
        }
    }
    free(line);
    return 0;
}

double* readInput(int* dimention){
    float firstInputElement;//initialized as double to check if corrupted input
    double* array = NULL;
    int returnValue;
    double* errorReturnValue = NULL;

    //READ FIRST
    returnValue = fscanf(stdin,"%g", &firstInputElement);

    //CHECK IF END OF LINE
    if (returnValue == -1){
        if (ferror(stdin) != 0){
            raiseError("FSCANF ERROR: I/O error");
            return errorReturnValue;
        }
        else{
            return errorReturnValue;
        }
    }
    //CHECK IF INPUT IS NUMERIC
    if (returnValue != 1){
        raiseError("Dimension no numerica");
        return errorReturnValue;
    }

    //CHECK IF INPUT IS TYPE UINT
    float mantiza = firstInputElement - (int)firstInputElement;
    if (mantiza > 0 || (firstInputElement <= 0)){
        raiseError("La dimension no es entera positiva");
        return errorReturnValue;
    }

    //ALLOCATE MEMORY FOR MATRICES INPUT ELEMENTS
    (*dimention) = (int)firstInputElement;
    array = malloc(sizeof(double)*(*dimention)*(*dimention)*2);

    //CHECK IF ALLOCATION IS SUCCESSFULL
    if (array == NULL){
        raiseError("No se pudo allocar memoria para inputs");
        return errorReturnValue;
    }
    //READ WHOLE LINE
    if (readElementsInLine((*dimention), array) != 0){
        return errorReturnValue;
    }
    return array;
}

int outputFile(FILE* out, char fileName[]){
    //ADAPTS FILE NAME
    char s[100] = "";
    strcat(s, "./");
    strcat(s, fileName);
    int return_value;
    int errorReturnValue = 1;

    //TRIES TO OPEN FILE
    FILE* fp;
    fp = fopen(s,"r");
    if(fp == NULL){
        raiseError("no se pudo abrir archivo de salida");
        return errorReturnValue;
    }

    //OUTPUTS
    char c;
	while(c != EOF){
        c = getc(fp);
        if ((return_value = fprintf(out,"%c",c)) < 0){
            raiseError("FPRINTF ERROR: I/O error");
            return errorReturnValue;
        }
	}

    if (ferror(stdin) != 0){
        raiseError("FGETC ERROR: I/O error");
        return errorReturnValue;
    }
    return 0;
}

matrix_t* create_matrix(size_t rows, size_t cols);// If returns null, there has been an error and it will be manage by the main program.

void fillUpMatrices(matrix_t* matrix_a, matrix_t* matrix_b, int dimention,double* input){

    int i;
    for (i = 0; i < dimention*dimention; i++){
        matrix_a->array[i] = input[i];
    }

    for (i = dimention*dimention; i < dimention*dimention*2; i++){
        matrix_b->array[i - dimention*dimention] = input[i];
    }
}

matrix_t* matrix_multiply(matrix_t* matrix_a,matrix_t* matrix_b);

int print_matrix(FILE* out, matrix_t* matrix_m){
    int dimention = matrix_m->rows;
    double x;
    int i;

    if (fprintf(out,"%d",dimention) < 0){ //se mira que el valor no sea negativo porque si lo es entonces es un error segun la documentacion de fprinf
        return 1;
    }
    if (fprintf(out,"%c",' ') < 0){
        return 1;
    }

	for (i = 0; i < dimention*dimention; i++){
        x = matrix_m->array[i];
        if (fprintf(out,"%g",x) < 0){
            return 1;
        }
        if (fprintf(out,"%c",' ') < 0){
            return 1;
        }
	}
    if (fprintf(out,"\n") < 0){
        return 1;
    }
    return 0; // si retorna 0 significa que no hubo errores.
}

int main(int argc, const char* argv[]){

    //INITIALIZATION
    FILE* OUT = stdout;
    bool endProgram = false;

    //HANDELING COMANDS
    if (argc > 1){
        if (strcmp(argv[1],"-h") == 0 || strcmp(argv[1],"--help") == 0){
            char fileName[] = "help";
            if ((outputFile(OUT,fileName)) != 0){
                return 1;
            }
            endProgram = true;
        }

        else if (strcmp(argv[1],"-V") == 0 || strcmp(argv[1],"--version") == 0){
            char fileName[] = "version";
            if ((outputFile(OUT,fileName)) != 0){
                return 1;
            }
            endProgram = true;
        }
        else{
            raiseError("command parameter invalid");
            return 1;
        }
    }

    //MAIN PROGRAM
    double* input = NULL;
    matrix_t* matrix_a = NULL;
    matrix_t* matrix_b = NULL;
    matrix_t* matrix_c = NULL;

    while (!endProgram){
        int dimention;
        input = readInput(&dimention);

        if (input == NULL){
            return 1;
        }
        matrix_a = create_matrix(dimention,dimention);
        if (matrix_a == NULL){
            free(input);
            raiseError("No se pudo allocar memoria para elementos de matriz");
            return 1;
        }

        matrix_b = create_matrix(dimention,dimention);
        if (matrix_b == NULL){
            destroy_matrix(matrix_a);
            free(input);
            raiseError("No se pudo allocar memoria para elementos de matriz");
            return 1;
        }
        fillUpMatrices(matrix_a,matrix_b, dimention,input);

        matrix_c = matrix_multiply(matrix_a,matrix_b);
        if (matrix_c == NULL){
            free(input);
            destroy_matrix(matrix_a);
            destroy_matrix(matrix_b);
            raiseError("No se pudo allocar memoria para elementos de matriz resultante");
            return 1;
        }

        if (print_matrix(OUT,matrix_c) != 0){
            free(input);
            destroy_matrix(matrix_a);
            destroy_matrix(matrix_b);
            destroy_matrix(matrix_c);
            raiseError("FPRINTF ERROR: I/O error");
            return 1;
        }

        free(input);
        destroy_matrix(matrix_a);
        destroy_matrix(matrix_b);
        destroy_matrix(matrix_c);
    }
    return 0;
}
