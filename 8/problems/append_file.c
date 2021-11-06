#include <stdio.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
    }

    FILE *f = fopen(argv[1], "a");

    if (f == NULL) {
        perror(argv[1]);
        return 1;
    }

    int ch;

    // fgetc(stdin) == getchar();
    // fseek();
    while ((ch = fgetc(stdin)) != EOF) {
        fputc(ch, f); // putchar();
    }

    fclose(f);

}