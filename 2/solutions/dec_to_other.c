#include <stdio.h>

int main(void) {
    
    int num;
    scanf("%d", &num);
    // X => 0xDEADBEEF
    // x => 0xdeadbeef
    printf("%d is: %o, %x", num, num, num);
    
    return 0;
    
}