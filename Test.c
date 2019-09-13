#include<stdio.h>
#include<stdbool.h>
#include<stdlib.h>

void inputError(const char* s){
    fprintf(stderr,"\n");
    fprintf(stderr,"=======================\n");
    fprintf(stderr,"ERROR MESSAGE: %s\n",s);
    fprintf(stderr,"=======================\n");
}

double* readInput(){

    float x;
    double y;
    double* array;
    int elementIndex;
    int dimention;

    int returnValue;

    int amountOfSuccesfullyReadInputs = 0;
    bool endOfLine = false;
    while (!endOfLine)
    {
        //READ
        returnValue = fscanf(stdin,"%g", &x);
        printf("returnValue: %d\n",returnValue);

        //CHECK IF END OF LINE
        if (returnValue == -1){
            endOfLine = true;
            break;
        }

        amountOfSuccesfullyReadInputs++;
        printf("amount of successfully read inputs: %d\n",amountOfSuccesfullyReadInputs);

        //ALLOCATE MEMORY FOR MATRICES INPUT ELEMENTS
        if (amountOfSuccesfullyReadInputs == 1){
            dimention = (int)x;
            array = malloc(sizeof(double)*dimention*dimention*2);
            if (array == NULL){
                inputError("no se pudo allocar memoria para inputs");
            }
        }

        //ADD ELEMENT TO ARRAY
        else{
            printf("Number is : %g\n",x);
            y = (double)x;
            elementIndex = amountOfSuccesfullyReadInputs - 2;
            array[elementIndex] = y;
            printf("Number in array is : %g\n",array[elementIndex]);
            printf("\n");
        }
    }

    //CHECK IF AMOUNT OF INPUTS IS CORRECT
    if (amountOfSuccesfullyReadInputs != (1 + dimention*dimention*2)){
        inputError("no se respeto la cantidad de elementos prometidos");
        free(array);
    }

    return array;
}


int main(int argc, const char* argv[]){

    readInput();

    return 0;
}


