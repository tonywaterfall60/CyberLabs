# Challenge — Analyze the Toy Binary

Build:

```bash
./build.sh
```

Then analyze:

```text
training-bin
```

## Required Kali Tools

Use at least four of:

- file
- strings
- readelf
- objdump
- checksec
- GDB
- rabin2
- radare2

Optional:

- Ghidra

## Tasks

1. Identify binary type and architecture.
2. Determine whether the binary is dynamically linked.
3. Inspect printable strings.
4. Identify imported library functions.
5. Inspect common binary protections.
6. Locate the success message.
7. Run the program normally.
8. Determine what input reaches the success path.
9. Use GDB or radare2 to observe or locate the comparison.
10. Explain the difference between:
    - static analysis
    - dynamic analysis
    - identifying behavior
    - exploiting a vulnerability

## Suggested Commands

```bash
file training-bin
strings training-bin
readelf -h training-bin
readelf -s training-bin
objdump -d training-bin
checksec --file=training-bin
rabin2 -I training-bin
rabin2 -z training-bin
gdb ./training-bin
radare2 -A training-bin
```

## Flag

The success path prints:

```text
SRU{}
```

The text inside the braces can be filled in later by the challenge maintainer.

## Deliverable

```text
Architecture:
Linking:
Protections:
Interesting strings:
Imported functions:
Success-path evidence:
Tools used:
Static-analysis finding:
Dynamic-analysis finding:
```
