#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<stdbool.h>

double* input = NULL; //GLOBAL ACCESS VARIABLE

typedef struct matrix {
    size_t rows;
    size_t cols;
    double* array;
} matrix_t;


void freeInputArray(){
    if (input != NULL){
        free(input);
    }
    input = NULL;
}

void printArray(int len,double* array){
    int i;
    for(i=0;i<len;i++){
        printf("elemento %d: %g\n",i,array[i]);
    }
}

void raiseError(const char* s){

    fprintf(stderr,"\n");
    fprintf(stderr,"=======================\n");
    fprintf(stderr,"ERROR MESSAGE: %s\n",s);
    fprintf(stderr,"=======================\n");
    fprintf(stderr,"\n");

    freeInputArray();
    exit (EXIT_FAILURE);
}

char *readLine(FILE* fp){
//The size is extended by the input with the value of the provisional
    int size = 10; //HARDCODED
    char *str;
    int ch;
    size_t len = 0;

    str = realloc(NULL, sizeof(char)*size);//size is start size
    if(!str)return str;
    while(EOF!=(ch=fgetc(fp)) && ch != '\n'){
        str[len++]=ch;
        if(len==size){
            str = realloc(str, sizeof(char)*(size+=16)); //HARDCODED
            if(!str)return str;
        }
    }

    if (ferror(stdin) != 0){
        free(str);
        raiseError("FGETC ERROR: I/O error");
    }

    str[len++]='\0';

    str = realloc(str, sizeof(char)*len);

    return str;
}

void readElementsInLine(int dimention, double* array){

    char* line = readLine(stdin);
    char* head_line_pointer = line;

    float x;
    int offset;
    int i = 0;
    int returnValue;
    int cantidadDeElementosLeidos;

    while (true)
    {
        returnValue = sscanf(head_line_pointer, "%g%n", &x, &offset);
        if (ferror(stdin) != 0){
            free(array);
            free(line);
            raiseError("SSCANF ERROR: I/O error");
        }


        if (returnValue == 1){
            head_line_pointer += offset;
            array[i] = (double)x;
            continue;
            i++;
        }

        if (returnValue == -1){
            cantidadDeElementosLeidos = i;
            if(cantidadDeElementosLeidos != dimention*dimention*2){
                free(array);
                free(line);
                raiseError("No coincide dimension con cantidad de elementos ingresados");
            }
            break;
        }

        if (returnValue != 1){
            free(array);
            free(line);
            raiseError("Input no numerico");
            break;
        }

    }
}

double* readInput(int* dimention){

    float firstInputElement;//initialized as double to check if corrupted input
    double* array;
    int returnValue;

    //READ FIRST
    returnValue = fscanf(stdin,"%g", &firstInputElement);

    //CHECK IF END OF LINE
    if (returnValue == -1){
        if (ferror(stdin) != 0){{raiseError("FSCANF ERROR: I/O error");}}
        else{exit (0);} // en este caso se identifica que el EOF no se debe a un error y se finaliza el programa sin problemas
    }
    //CHECK IF INPUT IS NUMERIC
    if (returnValue != 1){
        raiseError("Dimension no numerica");
    }

    //CHECK IF INPUT IS TYPE UINT
    float mantiza = firstInputElement - (int)firstInputElement;
    if (mantiza > 0 || (firstInputElement <= 0)){
        raiseError("La dimension no es entera positiva");
    }

    //ALLOCATE MEMORY FOR MATRICES INPUT ELEMENTS
    (*dimention) = (int)firstInputElement;
    array = malloc(sizeof(double)*(*dimention)*(*dimention)*2);

    //CHECK IF ALLOCATION IS SUCCESSFULL
    if (array == NULL){
        raiseError("No se pudo allocar memoria para inputs");
    }
    //READ WHOLE LINE
    readElementsInLine((*dimention), array);

    return array;
}

void outputFile(FILE* out, char fileName[]){
    //ADAPTS FILE NAME
    char s[100] = "";
    strcat(s, "./");
    strcat(s, fileName);
    int return_value;

    //TRIES TO OPEN FILE
    FILE* fp;
    fp = fopen(s,"r");
    if(fp == NULL){
        raiseError("no se pudo abrir archivo de salida");
    }

    //OUTPUTS
    char c;
	while(c != EOF){
        c = getc(fp);
        if ((return_value = fprintf(out,"%c",c)) < 0){raiseError("FPRINTF ERROR: I/O error");}
	}

    if (ferror(stdin) != 0){
        raiseError("FGETC ERROR: I/O error");
    }
}

matrix_t* create_matrix(size_t rows, size_t cols){
    matrix_t *matriz = malloc(sizeof(matrix_t));
    if (matriz == NULL){ //si no puede reservar la memoria, deja el puntero en NULL
        raiseError("no se pudo allocar memoria para matriz");
    }
    matriz->array = malloc(sizeof(double) * cols * rows); //representara los elementos de la matriz dispuestos en row-major order
    if (matriz->array == NULL){ //si no puede reservar la memoria, deja el puntero en NULL
        free(matriz);
        raiseError("no se pudo allocar memoria para elementos de matriz");
    }
    matriz->rows = rows;
    matriz->cols = cols;
    return matriz;
}

void destroy_matrix(matrix_t* m){
    if (m != NULL){
        free(m->array);
        free(m);
    }
}

void fillUpMatrices(matrix_t* matrix_a, matrix_t* matrix_b, int dimention,double* input){

    int i;
    for (i = 0; i < dimention*dimention; i++){
        matrix_a->array[i] = input[i];
    }

    for (i = dimention*dimention; i < dimention*dimention*2; i++){
        matrix_b->array[i - dimention*dimention] = input[i];
    }
}

matrix_t* matrix_multiply(matrix_t* matrix_a,matrix_t* matrix_b){

    int dimention = matrix_a->rows;

    matrix_t* matrix_c = create_matrix(dimention,dimention);

    int row;
    int column;
    int i;
    int j;
    double element;

    for (i = 0; i < dimention*dimention; i++){

        row = (int)(i / dimention);
        column = (int)(i % dimention);

        element = 0;
        for (j = 0; j < dimention; j++){

            element += matrix_a->array[row*dimention + j] * matrix_b->array[j*dimention + column];
        }
        matrix_c->array[i] = element;
    }
    return matrix_c;
}

void print_matrix(FILE* out, matrix_t* matrix_m){

    int dimention = matrix_m->rows;
    double x;
    int i;
    int return_value;

    if ((return_value = fprintf(out,"%d",dimention)) < 0){raiseError("FPRINTF ERROR: I/O error");} //se mira que el valor no sea negativo porque si lo es entonces es un error segun la documentacion de fprinf
    if ((return_value = fprintf(out,"%c",' ')) < 0){raiseError("FPRINTF ERROR: I/O error");}

	for (i = 0; i < dimention*dimention; i++){
        x = matrix_m->array[i];
        if ((return_value = fprintf(out,"%g",x)) < 0){raiseError("FPRINTF ERROR: I/O error");}
        if ((return_value = fprintf(out,"%c",' ')) < 0){raiseError("FPRINTF ERROR: I/O error");}
	}
    if ((return_value = fprintf(out,"\n")) < 0){raiseError("FPRINTF ERROR: I/O error");}
}

int main(int argc, const char* argv[]){

    //INITIALIZATION
    FILE* OUT = stdout;
    bool endProgram = false;

    //HANDELING COMANDS
    if (argc > 1){
        if (strcmp(argv[1],"-h") == 0 || strcmp(argv[1],"--help") == 0){
            char fileName[] = "help";
            outputFile(OUT,fileName);
            endProgram = true;
        }

        else if (strcmp(argv[1],"-V") == 0 || strcmp(argv[1],"--version") == 0){
            char fileName[] = "version";
            outputFile(OUT,fileName);
            endProgram = true;
        }
        else{
            raiseError("command parameter invalid");
        }
    }

    //MAIN PROGRAM
    while (!endProgram){

        matrix_t* matrix_a;
        matrix_t* matrix_b;
        matrix_t* matrix_c;

        int dimention;
        input = readInput(&dimention);
        matrix_a = create_matrix(dimention,dimention);
        matrix_b = create_matrix(dimention,dimention);
        fillUpMatrices(matrix_a,matrix_b, dimention,input);

        matrix_c = matrix_multiply(matrix_a,matrix_b);
        print_matrix(OUT,matrix_c);

        destroy_matrix(matrix_a);
        destroy_matrix(matrix_b);
        destroy_matrix(matrix_c);

        freeInputArray();
    }
    return 0;
}
