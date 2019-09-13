#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include "Tp0.h"

typedef struct matrix {
    size_t rows;
    size_t cols;
    double* array;
}matrix_t; // ACA SE AGREGO EL ALIAS y el typedef

int error(){ //COMENTARIO PARA NOSOTROS: Esta funcion deberia ejecutarse siempre que haya un error y debeira hacer lo que haya que hacer ante el y luego cortar el programa
             // si hay estructuras de datos con memoria ya almacenada primero deberan liberarse y despues cortar el programa

             //QUE RECIBA SRINTG Y NUM

    return 0;
}

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

void destroy_matrix(matrix_t* m){
    free(m->array);
    free(m);
}

void fillUpMatrices(matrix_t* matrix_a, matrix_t* matrix_b, int dimention){ /****Hay que agregar un EOF para leer cuando hay mas de una linea***/
    char *read;
    read = malloc(sizeof(char) * dimention * dimention * 2 * 26); // According to IEEE 754-1985, the longest notation for value represented by double type, i.e.: -2.2250738585072020E-308 has 24 chars.

    if (read == NULL){
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
        element = atof(separator);
        if (elementsQuantity < (2 * dimention)){ //dimention * 2 cantidad de elements van a la matriz a, y el resto a la matriz b;
            matrix_a->array[posInMatrixA] = element;
            posInMatrixA++;
        } else {
            matrix_b->array[posInMatrixB] = element;
            posInMatrixB++;
        }
        separator = strtok(NULL, "' '");
   }
}

matrix_t* matrix_multiply(matrix_t* matrix_a,matrix_t* matrix_b){


char* readInput(){

    int a;
    int b;

    scanf("%d", &a)

    scanf("%f", &b)

}
    size_t dim = matrix_a->cols; //ES LO MISMO AL SER MATRICES CUADRADAS
    size_t row=0; //CONTROLA LAS FILAS DE LA MATRIZ A PARA MULTIPLICAR
    size_t column=0; //CONTROLA LAS COLUMNAS DE LA MATRIZ B PARA MULTIPLICAR
    size_t i=0; //CONTADOR PARA REALIZAR TODAS LAS OPERACIONES
    double elem=0; // ACUMULADOR DE RESULTADO PARCIAL
    matrix_t* matriz_c = create_matrix(dim,dim); //CREO LA MATRIZ QUE VOY A DEVOLVER
    do{
        elem=0;
        for (size_t j=0;j<dim;j++){
            elem+= matrix_a->array[row*dim +j] * matrix_b->array[j*dim +column]; //MULTIPLICO ELEMENTO A ELEMENTO
        }
        column++; // UNA VEZ QUE OBTENGO UN NUMERO PASO A AL SIGUIENTE
        matriz_c->array[i]=elem; // GUARDO EL ELEMENTO CALCULADO
        if ((column % dim)==0){ //SI YA HICE UN MULTIPLO DE DIM DE OPERACIONES PASO A LA SIGUIENTE FILA
            column=0; //REINICIO EL CONTADOR DE COLUMNAS
            row++; //PASO A LA SIGUIENTE FILA
        }
        i++; //INCREMENTO LA CANTIDAD DE ELEMENTOS CALCULADOS
    }while (i< (dim*dim));
    return matriz_c;
};

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

    char* entireInput = readInput();

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

    //CORREGIR PARA QUE HAGA MAS DE UNA MULTIPLICACION

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
