#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<stdbool.h>

int main(int argc, const char* argv[]){

    int dimention = 2;
    float x;
    double y;
    int returnValue;
    int amountOfSuccesfullyReadInputs = 0;

    char *buffer;
    double b[100];
    size_t bufsize = dimention*dimention*2; //NO ES UN LIMITE FORZADO PORQUE LA FUNCION GETLINE PUEDE PEDIR MAS MEMORIA SI FUESE NECESARIO UNA MATRIZ MAS GRANDE

    buffer = malloc(bufsize * sizeof(char));

    getline(&buffer,&bufsize,stdin);
    printf("%s\n",buffer);
    sscanf(buffer,"%f",b);
    int i;
    for (i=0;i<100;i++){
        printf("elemento %d: %g\n",i,b[i]);
    }




    /*
    do{

        sscanf(s,"%g",&x);
        printf("read: %s\n",s);
        amountOfSuccesfullyReadInputs++;
    }
    while (returnValue != -1);
    printf("finished\n");
    */
}
