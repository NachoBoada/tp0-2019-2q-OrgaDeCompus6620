=================================================================================================================================================================
(DISEÑO DEL MIPS A IMPLEMENTAR


((TAG DE CREATE MATRIX)):        //create_matrix
CREO STACKFRAME
*SE GUARDA a0 EN STACKFRAME
*SE GUARDA a1 EN STACKFRAME


GUARDO sizeof(matrix_t) EN a0
LLAMO A mymalloc


SI v0 ES 0 SALTO A TAG DE RETORNO POR ERROR1 (porque seria NULL y entonces habria fallado) 
GUARDO v0 EN STACKFRAME


GUARDO (sizeof(double) * cols * rows) EN a0
LLAMO A mymalloc


SI v0 ES 0 SALTO A TAG DE RETORNO POR ERROR2 (porque seria NULL y entonces habria fallado y habria que hacer myfree del puntero a la matriz)


ASIGNO EN matriz->rows = rows;
ASIGNO EN matriz->cols = cols;
ASIGNO EN matriz->array = v0;
GUARDO EN v0 EL PUNTERO A LA MATRIZ ALLOCATEADA ANTES


((TAG DE RETORNO)):             //ret
SE DESTRUYE EL STACKFRAME


((TAG DE RETORNO ERROR1)):     //error1
SE GUARDA EN v0 EL VALOR 0 (NULL)
SE SALTA AL TAG DE RETORNO


((TAG DE RETORNO ERROR2)):      //error2
SE GUARDA EL PUNTERO A LA MATRIZ ALLOCATEADA EN a0
SE CORRE myfree
SE GUARDA EN v0 EL VALOR 0 (NULL)
SE SALTA AL TAG DE RETORNO
=================================================================================================================================================================
(VERSION ORIGINAL)
//SIMPLIFICARLO (si se puede)

matrix_t* create_matrix(size_t rows, size_t cols){ // If returns null, there has been an error and it will be manage by the main program.
    matrix_t *matriz = malloc(sizeof(matrix_t));
    if (matriz == NULL){ //si no puede reservar la memoria, deja el puntero en NULL
        return NULL; // NACHO: Version anterior: raiseError("no se pudo allocar memoria para matriz");
    }
    matriz->array = malloc(sizeof(double) * cols * rows); //representara los elementos de la matriz dispuestos en row-major order
    if (matriz->array == NULL){ //si no puede reservar la memoria, deja el puntero en NULL
        free(matriz);
        return NULL; //NACHO: raiseError("no se pudo allocar memoria para elementos de matriz");
    }
    matriz->rows = rows;
    matriz->cols = cols;
    return matriz

=================================================================================================================================================================
(SEPARADO EN DISTINTAS TAGS)

matrix_t* create_matrix(size_t rows, size_t cols){


matrix_t *matriz = malloc(sizeof(matrix_t));

if (matriz == NULL){ 
    return NULL; /
}

matriz->array = malloc(sizeof(double) * cols * rows);

if (matriz->array == NULL){ 
    free(matriz);
    return NULL;
}

matriz->rows = rows;
matriz->cols = cols;
return matriz;
}
=================================================================================================================================================================
