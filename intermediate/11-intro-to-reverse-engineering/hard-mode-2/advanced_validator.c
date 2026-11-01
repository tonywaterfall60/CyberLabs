#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "generated_flag.h"

/* CyberLabs Advanced Reverse Engineering — Hard Mode II.
   Educational local-only chained validator. */
#define KEYLEN 16u

static const uint8_t masked[KEYLEN] = {
    0x2E, 0xF9, 0x67, 0xE5, 0x53, 0xAD, 0xDC, 0x2D,
    0x2C, 0xD1, 0xCA, 0x12, 0x92, 0x39, 0xE2, 0x0C
};

static uint8_t rotl8(uint8_t n, unsigned s) {
    s &= 7u;
    if (s == 0u) return n;
    return (uint8_t)((n << s) | (n >> (8u - s)));
}

static uint32_t digest(const unsigned char *p, size_t n) {
    uint32_t h = 0x811C9DC5u;
    for (size_t i = 0; i < n; ++i) {
        h ^= p[i];
        h *= 0x01000193u;
    }
    return h;
}

static int verify(const unsigned char *p, size_t n) {
    if (n != KEYLEN) return 0;
    uint8_t state = 0xA7u;
    unsigned diff = 0u;
    for (unsigned i = 0; i < KEYLEN; ++i) {
        uint8_t k = (uint8_t)(0x3Fu + state * 0x1Du + i * 0x4Bu);
        unsigned sh = (i % 7u) + 1u;
        uint8_t t = rotl8((uint8_t)(p[i] ^ k), sh);
        uint8_t want = (uint8_t)(masked[i] ^ (uint8_t)(0x9Eu + i * 0x27u));
        diff |= (unsigned)(t ^ want);
        state = (uint8_t)(state + p[i] + t + 0x11u);
    }
    return diff == 0u && digest(p, n) == 0x08CC3DA2u;
}

int main(void) {
    char input[128];
    puts("CyberLabs RE Challenge: Hard Mode II (Chained Validator)");
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
