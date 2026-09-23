#include <stdio.h>
#include <string.h>

int main(void) {
    char buf[64];
    printf("Enter access phrase: ");
    if (!fgets(buf, sizeof(buf), stdin)) return 1;
    buf[strcspn(buf, "\n")] = 0;

    if (strcmp(buf, "northstar") == 0) {
        puts("SRU{}");
    } else {
        puts("Access denied.");
    }
    return 0;
}
