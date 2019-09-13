#include<stdio.h>
#include<stdbool.h>

int main(int argc, const char* argv[]){

    float x;
    int returnValue = fscanf(stdin,"%g", &x);
    printf("x es : %g\n",x);
    printf("return value es: %d\n",returnValue);

    double y;
    y = (double)x;
    printf("x es : %g\n",y);
    printf("return value es: %d\n",returnValue);
    return 0;
}

