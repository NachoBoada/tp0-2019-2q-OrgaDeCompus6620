#include <stdio.h>
#include "mymalloc.h"

int factorial(int n);

int main(int argc, char * const argv[])
{
    int n = 3;
    int res = factorial(n);
    printf("resultado es: %d",res);
    
    return 0;
}
