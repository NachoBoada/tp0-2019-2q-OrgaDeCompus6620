#include <stdio.h>

unsigned int  factorial (unsigned int n);

int main() {

    unsigned int n = 3;
    unsigned int res = factorial(n);

    printf( "factorial(%d) = %d\n",n,res);

    return 0 ;
}
