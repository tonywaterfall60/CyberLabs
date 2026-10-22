#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "generated_flag.h"

/* Build for educational reversing. Try analyzing hard-bin before reading source. */
static const uint8_t reference[17] = {
    241, 56, 136, 21, 22, 6, 141, 237, 140,
    140, 137, 107, 66, 43, 201, 24, 64
};

static uint8_t rotl8(uint8_t n, unsigned shift) {
    return (uint8_t)((n << shift) | (n >> (8u - shift)));
}

static int verify(const unsigned char *p, size_t n) {
    if (n != 17) return 0;
    uint32_t checksum = 0;
    unsigned mismatches = 0;
    for (unsigned i = 0; i < 17; ++i) {
        uint8_t source = p[(i * 5u) % 17u];
        uint8_t key = (uint8_t)(0x5du + 17u * i);
        uint8_t transformed = rotl8((uint8_t)(source ^ key), 3u);
        mismatches |= (unsigned)(transformed ^ reference[i]);
        checksum += source;
    }
    return mismatches == 0 && checksum == 1688u;
}

int main(void) {
    char input[128];
    puts("CyberLabs RE Challenge: Hard Mode");
    fputs("Access key: ", stdout);
    if (!fgets(input, sizeof input, stdin)) return 1;
    input[strcspn(input, "\r\n")] = '\0';
    if (!verify((const unsigned char *)input, strlen(input))) {
        puts("Access denied.");
        return 2;
    }
    puts("VALIDATION PASSED");
    puts(HARD_MODE_FLAG);
    return 0;
}
