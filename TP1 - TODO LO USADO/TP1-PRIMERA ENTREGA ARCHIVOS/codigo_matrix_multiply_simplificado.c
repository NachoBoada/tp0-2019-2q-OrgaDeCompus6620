matrix_t* matrix_multiply(matrix_t* matrix_a,matrix_t* matrix_b){
    int aux1;
    int aux2;
    int row;
    int column;
    int i;
    int j;
    int dimention;
    double element;
    dimention = matrix_a->rows;
    matrix_t* matrix_c;
    matrix_c = create_matrix(dimention,dimention);
    for (i = 0; i < dimention*dimention; i++){
        row = (int)(i / dimention);
        column = (int)(i % dimention);
        element = 0;
        for (j = 0; j < dimention; j++){
            aux1 = row*dimention;
            aux1 = aux1 + j;
            aux1 = matrix_a->array[aux1];
            aux2 = j*dimention;
            aux2 = aux2 + column;
            aux2 = matrix_b->array[aux2];
            aux1 = aux1 * aux2;
            element = element + aux1;}
        matrix_c->array[i] = element;}
    return matrix_c;}

