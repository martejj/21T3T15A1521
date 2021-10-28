#include <stdio.h>

int main(void) {

    FILE *f = fopen("a", "r");
    fputc('a', f);
    fgetc(f);

}