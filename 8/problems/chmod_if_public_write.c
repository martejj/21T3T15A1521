#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {

    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    char *pathname = argv[1];

    struct stat s;

    if(stat(pathname, &s) != 0) {
        perror(pathname);
        return 1;
    }

    mode_t mode = s.st_mode;

    // If file is writable for others then unset it 
    if ((mode & S_IWOTH) != 0) {
        printf("Public writable\n");
        mode_t new_mode = (mode & ~S_IWOTH);
        s.st_mode = new_mode;

        if (chmod(pathname, new_mode) != 0) {
            perror(pathname);
            return 1;
        }

        printf("Removing public writable\n");
    } else {
        printf("Not public writable\n");
    }

    return 0;
}