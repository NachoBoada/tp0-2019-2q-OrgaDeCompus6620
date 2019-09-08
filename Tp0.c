#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include "Tp0.h"

struct matrix {
    size_t rows;
    size_t cols;
    double* array;
};

int error(){ //COMENTARIO PARA NOSOTROS: Esta funcion deberia ejecutarse siempre que haya un error y debeira hacer lo que haya que hacer ante el y luego cortar el programa
             // si hay estructuras de datos con memoria ya almacenada primero deberan liberarse y despues cortar el programa
    return 0;
}

//PRE: RECIBE UN CHAR*
//POST: DEVUELVE LA DIMENSION O 0(CERO) SI HAY ERROR. NO SE ACEPTA DIMENSION 0.
size_t readMatrixDimention()
{
    char string[20];//TODO -- NO SE COMO RESOLVER ESTO PARA QUE SEA GENERICO
    scanf("%s",string);

    long result = 0;
    if (strlen(string)>10){
        //ERROR - BIGGER THAN INT
        //error();
        exit(1);//TODO -- SE QUITA Y QURDA ERROR SOLO
    }
    for (int i = 0; i < strlen(string); i++)
    {
        if (((int)string[i]< 48) || ((int)string[i]>57))
        {
            //ERROR - NOT A NUMBER
            //error();
            exit(2);//TODO -- SE QUITA Y QURDA ERROR SOLO
        }
        else
        {
            //LONG NUMBER
            result = (result*10) + (string[i] - 48);
        }
    }
    if (result>4294967295) //UPPER LIMIT
    {
        //ERROR - OVERFLOW
        //error();
        exit(3);//TODO -- SE QUITA Y QURDA ERROR SOLO
    }
    else return (size_t) (result);
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

// Constructor de matrix_t
matrix_t* create_matrix(size_t rows, size_t cols){
    matrix_t *matriz = malloc(sizeof(matrix_t));
    if (matriz == NULL){ //si no puede reservar la memoria, deja el puntero en NULL
        error("MatrizNull");
    }
    matriz->array = malloc(sizeof(size_t) * cols * rows); //representara los elementos de la matriz dispuestos en row-major order
    if (matriz->array == NULL){ //si no puede reservar la memoria, deja el puntero en NULL
        free(matriz);
        error("no hay memoria suficiente para crear la matriz");
    }
    matriz->rows = rows;
    matriz->cols = cols;
    return matriz;
}


// Destructor de matrix_t
void destroy_matrix(matrix_t* m){
    free(m->array);
    free(m);
}



void fillUpMatrices(matrix_t* matrix_a, matrix_t* matrix_b, int dimention){ /****Hay que agregar un EOF para leer cuando hay mas de una linea***/
    dimention = 9;
    char *read;
    read = malloc(sizeof(char) * dimention * 2 * 2 * 11); // 10 digitos por elemento parece razonable mas uno por cada espacio.
    if (read == NULL){
        ////error("no hay memoria);
    }

    double *allNumbers = NULL;
    allNumbers = malloc(sizeof(double) * (dimention * 2 * 2)); // cada matriz tiene 2N elementos, y son 2 matrices
    if (allNumbers == NULL){
        ////error("no hay memoria);
    }

    scanf("%[^\n]s",read); //Guarda todos los digitos. Sin el [^\n] se corta en cada espacio.
    if (read == NULL){
        ////error("no se guaro lo leido del stdin");
    }
    printf( "read %s\n", read );

    char *separator;
    separator = strtok(read, "' '");
    separator = strtok(NULL, "' '"); //hay que saltar al primer elemento que N
    double element;
    int elementsQuantity = 0, posInMatrixA = 0, posInMatrixB = 0;
    while( separator != NULL ) {
        printf( "sepa %s\n", separator );
        element = atof(separator);
        if (elementsQuantity < (2 * dimention)){ //dimention * 2 cantidad de elements van a la matriz a, y el resto a la matriz b;
            matrix_a->array[posInMatrixA] = element;
            posInMatrixA++;
        } else {
            matrix_b->array[posInMatrixB] = element;
            posInMatrixB++;
        }
        printf( "element %f\n", element );
        separator = strtok(NULL, "' '");
   }
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

    fillUpMatrices(matrix_a,matrix_b, dimention); //COMENTARIO PARA NOSOTROS: Lee los siguientes valores que se ingresan por stdin hasta llegar al \n y corta. Si en algun momento hay algo fuera de lugar
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
