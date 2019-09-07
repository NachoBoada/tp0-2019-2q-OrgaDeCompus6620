#include<stdio.h>
#include<curses.h>
#include<string.h>

typedef struct matrix {
    size_t rows;
    size_t cols;
    double* array;
} matrix_t;

int error(){
    return 0;
}
void outputFile(char fileName[]){
    //ADAPTS FILE NAME
    char s[100];
    strcat(s, "./");
    strcat(s, fileName);

    //TRIES TO OPEN FILE
    FILE *fp;
    fp = fopen(s,"r");
    if(fp == NULL){error();}

    //OUTPUTS
    char c;
	do
    {
        c = getc(fp);
		printf("%c",c);
	}
	while(c != EOF);
}

int main(int argc, const char* argv[])
{
    int a = 1; //COMENTARIO PARA NOSOTROS: Por alguna razon si no pongo a y pongo 1 en vez no anda

    if (strcmp(argv[a],"-h") == 0 || strcmp(argv[a],"--help") == 0){
        char fileName[] = "help";
        outputFile(fileName);
    }

    if (strcmp(argv[a],"-V") == 0 || strcmp(argv[a],"--version") == 0){
        char fileName[] = "version";
        outputFile(fileName);
    }


    return 0;
}
