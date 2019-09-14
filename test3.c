#include<stdio.h>
#include<stdbool.h>

int main(int argc, const char* argv[]){

    int row;
    int column;
    int i;
    int j;

    for (i = 0; i < dimention; i++){

        row = (int)(i / dimention);
        column = (int)(i % dimention);

        element = 0
        for (j = 0; j < dimention; j++){

            element += matrix_a->array[row*dimention + j] * matrix_b->array[j*dimention + column];
        }
        matrix_c->array[i] = element
    }
}
