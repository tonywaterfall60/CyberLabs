#include <stdio.h>
#include <stdint.h>
#include <string.h>

static uint32_t mix(const char *s) {
    uint32_t h = 0x2468ACE1u;
    while (*s) {
        h ^= (unsigned char)*s++;
        h = (h << 3) | (h >> 29);
        h += 0x11111111u;
    }
    return h;
}

static int valid(const char *s) {
    if (strlen(s) != 10) return 0;
    if (s[0] != 'a' || s[4] != 'y' || s[7] != 'i') return 0;
    return mix(s) == 0xD41FB6EEu;
}

int main(void) {
    char buf[64];
    puts("CyberLabs Intermediate Validator");
    printf("Enter access phrase: ");
    if (!fgets(buf, sizeof(buf), stdin)) return 1;
    buf[strcspn(buf, "\r\n")] = 0;

    if (valid(buf)) {
        puts("SUCCESS: validation path reached.");
        return 0;
    }

    puts("Access denied.");
    return 2;
}