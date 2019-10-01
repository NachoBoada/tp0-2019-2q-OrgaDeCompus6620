#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<stdbool.h>


int bufSize = 20;

int main(int argc, char *argv[])
{
    FILE* fp;

    if (argc != 2)


    {
    fprintf(stderr,
            "Usage: %s <soure-file>\n", argv[0]);
    return 1;
    }
    if ((fp = fopen(argv[1], "r")) == NULL)
    { /* Open source file. */
    perror("fopen source-file");
    return 1;
    }

    int i = 0;
    char buf[bufSize];
    int concatenar = 0;
    int cumSize = bufSize;
    char* cum = realloc(NULL,sizeof(char)*cumSize);
    while (fgets(buf, sizeof(buf), fp) != NULL)
    {

    if (concatenar){
        cumSize+=bufSize;
        cum = realloc(cum, sizeof(char)*cumSize);
        printf("lala\n");
        cum = strcat(cum,buf);
        concatenar = 0;
    }
    else{
        cum = buf;
    }

    printf("%s\n", cum);
    printf("i: %d\n", i);

    if (cum[strlen(cum) - 1] != '\n'){
        concatenar = 1;
    }

    i++;

    }

    if (ferror(stdin) != 0){
        //
    }

    fclose(fp);
    return 0;
}
