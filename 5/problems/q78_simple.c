#include <stdio.h>

int main(void) {
    
    int numbers[10] = {0};
    int i = 0;

    main_scan_start:
    if (i >= 10) goto main_scan_end;
        int input;
        scanf("%d", &input);
        int *address = numbers + 4*i;
        *address = input;
        i++;
    goto main_scan_start;
    main_scan_end:

    i = 0;
    main_print_start:
    if (i >= 10) goto main_print_end;
        int *address = numbers + 4*i;
        int output = *address;
        printf("%d\n", output);
        i++;
    goto main_print_start;
    main_print_end:

    return 0;

}