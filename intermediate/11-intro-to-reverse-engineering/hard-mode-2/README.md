# Hard Mode II — Chained Validator

**Optional advanced stretch challenge** for [Intermediate 11 — Intro to Reverse Engineering](../README.md), after completing Hard Mode I. Allow approximately **60–120 additional minutes**.

## Scenario
Analyze a stripped, PIE-enabled x86-64 Linux executable which validates a 16-byte access key using a **chained state-dependent transform**, a variable rotation, masked expected bytes, and a second digest gate. Derive the key by reversing the logic rather than brute forcing. Run the program with the correct key to display a practice `SRU{...}` flag.

## Setup (Kali Linux)
```bash
cd intermediate/11-intro-to-reverse-engineering/hard-mode-2
bash build-advanced.sh
file hard2-bin
checksec --file=hard2-bin
./hard2-bin
```
The build creates a random **practice-only** flag unless an instructor supplies `ADVANCED_RE_FLAG` or the original lab runtime flag has been prepared. Practice flags are not automatically registered with the dashboard. Source is available for offline rebuilding, but **do not read `advanced_validator.c` before completing your reverse engineering attempt**. In an assessed event, ask your instructor for the prebuilt binary.

## Tasks
1. Record architecture, PIE, NX, RELRO, and whether symbols are present.
2. Inspect strings and imported functions. Determine why the access key is not visible in plaintext.
3. Identify the input length check, validation loop, and stored masked-byte array.
4. Explain the state-dependent XOR key, variable rotate-left, and feedback update.
5. Identify the 32-bit digest as a second correctness gate.
6. Write your **own Python inverse**: unmask the expected output, rotate right, undo XOR, then update the state before processing the next byte.
7. Test your recovered key against `./hard2-bin`. Show an instructor both the key and successful program output; extracting the embedded flag with `strings` alone does not establish completion.

Useful commands:
```bash
strings hard2-bin | less
readelf -h hard2-bin
objdump -d -M intel hard2-bin | less
gdb ./hard2-bin
radare2 -A hard2-bin
```
Ghidra is optional.

## Graduated hints
<details><summary>Hint 1</summary>The accepted length is 16; no direct plaintext key comparison exists.</details>
<details><summary>Hint 2</summary>Each byte is XORed with a key derived from a running state and then rotated left by a position-dependent amount.</details>
<details><summary>Hint 3</summary>The state changes after each byte; later bytes depend on earlier recovered bytes.</details>
<details><summary>Hint 4</summary>Undo the expected-output mask, rotate right, XOR the derived key, and update the state in that order.</details>

## Scope and cleanup
Analyze only the local challenge binary. This is reverse engineering, not exploitation.
```bash
rm -rf hard2-bin runtime
```

Solutions, accepted access key, and instructor verification instructions are maintained **only in the private instructor repository**.
