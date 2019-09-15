#include <stdio.h>

int main(void)
{
    char line[] = "1.1 2.2 3.3 4.4 5.5";
    char *data = line;
    int offset;
    float n;
    int sum = 0;

    while (sscanf(data, " %g%n", &n, &offset) == 1)
    {
        sum += n;
        data += offset;
        printf("read: %g\n",n);
    }

    printf("sum = %d\n", sum);
    return 0;
}
