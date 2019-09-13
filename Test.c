#include<stdio.h>
#include<stdbool.h>

void readInput(){

    float n;
    int returnValue;

    bool endOfLine = false;
    while (!endOfLine)
    {
        returnValue = fscanf(stdin,"%g", &n);

        if (returnValue == -1){
            endOfLine = true;
            break;
        }

        printf("Number is : %g\n",n);
        printf("returnValue is : %d\n",returnValue);
        printf("\n");
    }
    printf("returnValue is : %d\n",returnValue);
}


int main(int argc, const char* argv[]){

    readInput();

    return 0;
}


