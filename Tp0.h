#ifndef TP0_H_INCLUDED
#define TP0_H_INCLUDED


struct matrix;
typedef struct matrix matrix_t;

//PRE: RECIBE UNA ENTRADA DE STDIN
//POST: DEVUELVE LA DIMENSION O 0(CERO) SI HAY ERROR. NO SE ACEPTA DIMENSION 0.
int readMatrixDimention();

//PRE: RECIBE UN PUNTERO A MATRIZ
//POST: DEVUELVE POR STDOUT LA MATRIZ PASADA POR PARAMETRO
void outputFile(matrix_t* matrix_c);

//PRE: RECIBE FILA Y COLUMNAS
//POST: DEVUELVE Y CREA UNA MATRIZ DE DICHAS DIMENSIONES VACIA
matrix_t* create_matrix(size_t rows, size_t cols);

// Destructor de matrix_t
void destroy_matrix(matrix_t* m);

//Lee los valores que se ingresan por stdin hasta llegar al \n y corta. De haber error corta la ejecucion.
void fillUpMatrices(matrix_t* matrix_a, matrix_t* matrix_b, int dimention);

#endif // TP0_H_INCLUDED
