#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<stdbool.h>

#define bufSize 20

int main(int argc, char *argv[])
{
    FILE* fp;
    char buf[bufSize];
    if (argc != 2)
    bool concatenar = false;
    char* cum;


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
    while (fgets(buf, sizeof(buf), fp) != NULL)
    {
    if (concatenar){
        cum = realloc(cum, sizeof(char)*(cum+=bufSize));
        cum = strcat(cum,buf);
    }

    cum = buf;
    printf("%s\n", cum);
    printf("i: %d\n", i);

    if (bif[strlen(buf) - 1] != '\n'){
        concatenar = true;
    }

    i++;

    }

    fclose(fp);
    return 0;
}
