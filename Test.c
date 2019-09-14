#include<stdio.h>
#include<stdbool.h>
#include<stdlib.h>

void raiseError(const char* s){
    fprintf(stderr,"\n");
    fprintf(stderr,"=======================\n");
    fprintf(stderr,"ERROR MESSAGE: %s\n",s);
    fprintf(stderr,"=======================\n");
}

double* readInput(int* dimention){

    float x;
    double y;
    double* array;
    int elementIndex;
    int returnValue;

    bool error = false;

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
            raiseError("Input no numerico");

            if (array != NULL){
                free(array);
            }
            error = true;
            break;
        }

        amountOfSuccesfullyReadInputs++;

        //ALLOCATE MEMORY FOR MATRICES INPUT ELEMENTS
        if (amountOfSuccesfullyReadInputs == 1){

            //CHECK IF INPUT IS TYPE UINT
            float mantiza = x - (int)x;
            if (mantiza > 0 || (x <= 0)){
                raiseError("La dimension no es entera positiva");
                error = true;
                break;
            }

            (*dimention) = (int)x;
            array = malloc(sizeof(double)*(*dimention)*(*dimention)*2);

            //CHECK IF ALLOCATION IS SUCCESSFULL
            if (array == NULL){
                raiseError("no se pudo allocar memoria para inputs");
                error = true;
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
    if (amountOfSuccesfullyReadInputs == 0 && !error){
        raiseError("no se ingreso ningun valor");
        error = true;
    }
    //CHECK IF AMOUNT OF INPUTS IS CORRECT
    if (amountOfSuccesfullyReadInputs != (1 + (*dimention)*(*dimention)*2) && !error){
        raiseError("no se respeto la cantidad de elementos prometidos");
        free(array);
        error = true;
    }

    printf("dimention: %d\n",*dimention);
    printf("element %d: %f\n",0,array[0]);
    printf("element %d: %f\n",1,array[1]);
    printf("element %d: %f\n",2,array[2]);
    printf("element %d: %f\n",3,array[3]);
    printf("element %d: %f\n",4,array[4]);
    printf("element %d: %f\n",5,array[5]);
    printf("element %d: %f\n",6,array[6]);
    printf("element %d: %f\n",7,array[7]);

    return array;
}

int main(int argc, const char* argv[]){

    int dimention;
    readInput(&dimention);

    return 0;
}


