#include<stdio.h>
#include<stdbool.h>
#include<stdlib.h>

void raiseError(const char* s,bool* error){
    fprintf(stderr,"\n");
    fprintf(stderr,"=======================\n");
    fprintf(stderr,"ERROR MESSAGE: %s\n",s);
    fprintf(stderr,"=======================\n");
    *error = true;
}

double* readInput(int* dimention, bool *error){

    float x;
    double y;
    double* array;
    int elementIndex;
    int returnValue;

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
            raiseError("Input no numerico",error);

            if (array != NULL){
                free(array);
            }
            break;
        }

        amountOfSuccesfullyReadInputs++;

        //ALLOCATE MEMORY FOR MATRICES INPUT ELEMENTS
        if (amountOfSuccesfullyReadInputs == 1){

            //CHECK IF INPUT IS TYPE UINT
            float mantiza = x - (int)x;
            if (mantiza > 0 || (x <= 0)){
                raiseError("La dimension no es entera positiva",error);
                break;
            }

            (*dimention) = (int)x;
            array = malloc(sizeof(double)*(*dimention)*(*dimention)*2);

            //CHECK IF ALLOCATION IS SUCCESSFULL
            if (array == NULL){
                raiseError("no se pudo allocar memoria para inputs",error);
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
    if (amountOfSuccesfullyReadInputs == 0 && !(*error)){
        raiseError("no se ingreso ningun valor",error);
    }
    //CHECK IF AMOUNT OF INPUTS IS CORRECT
    if (amountOfSuccesfullyReadInputs != (1 + (*dimention)*(*dimention)*2) && !(*error)){
        raiseError("no se respeto la cantidad de elementos prometidos",error);
        free(array);
    }
    return array;
}

int main(int argc, const char* argv[]){

    int dimention;
    bool error;
    double* input = readInput(&dimention,&error);

    int i;
    for (i = 0;i<8;i++){
        printf("elemento %d: %g\n",i,input[i]);
    }
    printf("\n%d\n",error);

    return 0;
}


