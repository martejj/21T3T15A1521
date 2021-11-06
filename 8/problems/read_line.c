#include <stdio.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
    }

    FILE *f = fopen(argv[1], "r");

    if (f == NULL) {
        perror(argv[1]);
        return 1;
    }

    int ch;

    // fgetc(stdin) == getchar();
    while ((ch = fgetc(f)) != EOF) {
        fputc(ch, stdout); // putchar();
    }

    fclose(f);

}