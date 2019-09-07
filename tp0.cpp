#include<stdio.h>
#include<curses.h>
#include<string.h>

typedef struct matrix {
    size_t rows;
    size_t cols;
    double* array;
} matrix_t;

int error(){ //COMENTARIO PARA NOSOTROS: Esta funcion deberia ejecutarse siempre que haya un error y debeira hacer lo que haya que hacer ante el y luego cortar el programa
             // si hay estructuras de datos con memoria ya almacenada primero deberan liberarse y despues cortar el programa
    return 0;
}
void outputFile(char fileName[]){
    //ADAPTS FILE NAME
    char s[100];
    strcat(s, "./");
    strcat(s, fileName);

    //TRIES TO OPEN FILE
    FILE *fp;
    fp = fopen(s,"r");
    if(fp == NULL){error();}

    //OUTPUTS
    char c;
	do
    {
        c = getc(fp);
		printf("%c",c);
	}
	while(c != EOF);
}

int main(int argc, const char* argv[])
{
    //HANDELING COMANDS
    int a = 1; //COMENTARIO PARA NOSOTROS: Por alguna razon si no pongo a y pongo 1 en vez no anda

    if (strcmp(argv[a],"-h") == 0 || strcmp(argv[a],"--help") == 0){
        char fileName[] = "help";
        outputFile(fileName);
    }

    if (strcmp(argv[a],"-V") == 0 || strcmp(argv[a],"--version") == 0){
        char fileName[] = "version";
        outputFile(fileName);
    }


    //MAIN PROGRAM

    int dimention = readMatrixDimention(); //COMENTARIO PARA NOSOTROS: Lee el primer valor ingresado por stdin (que supuestamente es el N. Si no es un numero ejectua "error()"

    matrix_t* matrix_a = create_matrix(dimention,dimention);
    matrix_t* matrix_b = create_matrix(dimention,dimention);

    fillUpMatrices(matrix_a,matrix_b); //COMENTARIO PARA NOSOTROS: Lee los siguientes valores que se ingresan por stdin hasta llegar al \n y corta. Si en algun momento hay algo fuera de lugar
                                       //ejecuta a "error()"

    matrix_t* matrix_c = matrix_multiply(matrix_a,matrix_b);

    //print_matrix(fp,matrix_c);

    destroy_matrix(matrix_a);
    destroy_matrix(matrix_b);
    destroy_matrix(matrix_c);

    /*COMENTARIO PARA NOSOTROS:
    Resumiendo, hay que hacer las funciones:

    readMatrixDimention
    create_matrix
    fillUpMatrices
    matrix_multiply
    destroy_matrix
    error
    */

    return 0;
}
