#include <stdio.h>
#include "lib.h"

int main()
{
    int result = some_computation(5);
    printf("Result = %d\n", result);
    int is_even = some_other_computation(10);
    printf("10 is even = %d\n", is_even);

    return 0;
}