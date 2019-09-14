#ifndef TP0_H_INCLUDED
#define TP0_H_INCLUDED


struct matrix;
typedef struct matrix matrix_t;

//PRE: RECIBE UN MENSAJE DE ERROR
//POST: DEVUELVE EL MENSAJE POR STDERR Y CAMBIA EL VALOR DE ERROR A TRUE
void raiseError(const char* s, bool *error);

//PRE: RECIBE UNA PUNTERO A DIMENSION
//POST: ALMACENA LA DIMENSION INGRESADA POR STDIN Y ALMACENA TODOS LOS DEMAS INPUTS NUMERICOS EN UN ARRAY
    // EN CASO DE ERROR CORTA LA EJECUCION
double* readInput(int* dimention, bool *error);

//PRE: RECIBE UN NOMBRE DE ARCHIVO Y UN FILEPOINTER
//POST: IMPRIME POR EL FILEPOINTER INDICADO EL CONTENIDO DEL ARCHIVO INDICADO
void outputFile(FILE* fp,char fileName[]);

//PRE: RECIBE FILA Y COLUMNAS
//POST: DEVUELVE Y CREA UNA MATRIZ DE DICHAS DIMENSIONES VACIA
matrix_t* create_matrix(size_t rows, size_t cols, bool *error);

// Destructor de matrix_t
void destroy_matrix(matrix_t* m);

//PRE: RECIBE LA DIMENCION, LOS ELEMENTOS DE LAS MATRICES y LAS MATRICES VACIAS
//POST: LAS LLENA CON SUS CORRESPONDIENTES VALORES
void fillUpMatrices(matrix_t* matrix_a, matrix_t* matrix_b, int dimention,double* inputs);

//PRE: RECIBE DOS MATRICES EN EL ORDEN A MULTIPLICAR
//POST: DEVUELVE EL PRODUCTO
matrix_t* matrix_multiply(matrix_t* matrix_a,matrix_t* matrix_b, bool* error);

//PRE: RECIBE UN FILEPOINTER Y UNA MATRIZ A ENVIAR A POR LA SALIDA ELEGIDA
//POST: IMPRIME POR STDOUT LA MATRIZ EN ROW MAYOR ORDER PRECEDIDA POR SU DIMENCION Y FINALIZANDO CON UN '\n'
void print_matrix(FILE* fp, matrix_t* matrix_m, bool* error);
#endif // TP0_H_INCLUDED
