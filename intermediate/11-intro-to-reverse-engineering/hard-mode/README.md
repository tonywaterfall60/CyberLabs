# Hard Mode — Permuted Byte Validator

**Optional stretch challenge** for Intermediate 11. Estimate **45–90 additional minutes** after completing the original challenge.

## Scenario

A new stripped x86-64 Linux executable checks an access key using several transformations. Recover the correct key by reversing the program's control flow and its byte checks. This is a self-contained binary analysis exercise, **not exploitation**.

## Setup (Kali)

From this directory:

```bash
bash build-hard.sh
file hard-bin
./hard-bin
```

The file `hard_validator.c` is included so members can rebuild offline, but **do not open it until after solving**. If you read it first, you are reviewing C rather than reverse engineering. The challenge is self-paced and honor-system; a prepared binary without local source distribution would be needed for a source-hidden competition.

## Analysis tasks

1. Determine architecture, PIE/NX/RELRO, and whether symbols are stripped (`file`, `readelf`, `checksec`).
2. Review strings/imports and locate the input-handling and validation code.
3. Identify the accepted input length and the loop bounds.
4. Reconstruct the **index permutation**, **per-byte key**, and **bit rotation**.
5. Recover the required input by **inverting** the transform, not by brute forcing all strings.
6. Validate the recovered key by running `./hard-bin` and explain the secondary check.
7. Write a short explanation showing which outputs were observed and which details you inferred from assembly.

Useful tools: `objdump -d -M intel hard-bin`, `gdb ./hard-bin`, `radare2 -A hard-bin`, optional Ghidra, and Python for independently implementing the inverse transformation.

### Hint ladder

<details><summary>Hint 1</summary>Do not assume the loop checks input bytes in the same order they were entered.</details>

<details><summary>Hint 2</summary>Find the modulo operation involving the loop index and a fixed length.</details>

<details><summary>Hint 3</summary>Identify XOR and an 8-bit rotate-left. Reverse the rotate first, then XOR.</details>

<details><summary>Hint 4</summary>For each transformed index i, the corresponding original position is (5*i) modulo 17.</details>

## Optional completion flag

This stretch exercise **reuses** the original Intermediate 11 dynamic flag, not a separately registered flag. The checker prints that flag only after correct validation **and only if the instructor has supplied the original flag file**:

```bash
mkdir -p runtime
cp ../challenge/runtime/dynamic-flag.txt runtime/dynamic-flag.txt
./hard-bin
```

Only copy the flag artifact after the instructor has prepared it via the existing Intermediate 11 process. Without the file, successful validation prints a completion notice instead. **Do not submit the reused flag twice as a new dashboard challenge.**

**Note:** Since the flag file lives in the student's local filesystem, possession of the flag by itself is not proof of successful reversing. Instructors should require the accepted key and the recovered algorithm.

## Cleanup

```bash
rm -rf hard-bin runtime
```

Do not run or test against unrelated binaries or services.
