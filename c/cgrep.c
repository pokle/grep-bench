#include <stdio.h>
#include <string.h>


int main(int argc, char *argv[]) {
    
    if (argc < 2) {
        fprintf(stderr, "usage: %s TOKEN FILES...\n", argv[0]);
        return 1;
    }

    const char *token = argv[1];

    for(int arg = 2; arg < argc; arg++) {

        const char *path = argv[arg];

        FILE *stream = fopen(path, "r");
        if (stream == NULL) {
            perror(path);
            return 2;
        }

        char * line;
        size_t len;
        while (NULL != (line = fgetln(stream, &len))) {
            char *match = strnstr(line, token, len);
            if (match != NULL) {
                fwrite(line, len, 1, stdout);
            }
        }

        fclose(stream);
    }

    return 0;
}