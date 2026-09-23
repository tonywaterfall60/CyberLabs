#include <stdio.h>
#include <string.h>

void process(const char *input) {
    char buffer[64];
    strcpy(buffer, input);
    printf("Processed: %s\n", buffer);
}

int main(int argc, char **argv) {
    if (argc != 2) {
        puts("Usage: ./vuln-bin <input>");
        return 1;
    }
    process(argv[1]);
    return 0;
}
