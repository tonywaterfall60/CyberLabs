# Intermediate 11 — Intro to Reverse Engineering

**Difficulty:** Intermediate  
**Estimated time:** 90–120 minutes  
**Prerequisites:** Linux + Python + command-line comfort  
**Environment:** Kali Linux, GCC, file, strings, readelf, objdump, checksec, GDB, radare2/rabin2; optional Ghidra

## Why This Event Exists

Reverse engineering teaches members how to understand a program when source code is unavailable. This event focuses on safe analysis of a toy local binary and introduces several tools already available in Kali.

## Learning Objectives

Members should be able to:

- identify binary type and architecture
- inspect printable strings
- inspect ELF headers and imported functions
- inspect common binary protections
- distinguish static from dynamic analysis
- use GDB to observe execution
- use radare2/rabin2 for alternate static inspection
- describe basic program flow
- document evidence before forming conclusions

## Kali Tools Used

| Tool | Purpose |
|---|---|
| file | identify format/architecture |
| strings | printable strings |
| readelf | ELF metadata |
| objdump | disassembly/symbol information |
| checksec | common binary protections |
| GDB | dynamic debugging |
| rabin2 | radare2 binary metadata/strings |
| radare2 | interactive analysis |
| Ghidra | optional GUI decompilation |

## Workflow

```text
Identify format / architecture
        ↓
Inspect protections
        ↓
Inspect strings and imports
        ↓
Locate validation-related control flow
        ↓
Run with controlled inputs
        ↓
Observe execution dynamically
        ↓
Reconstruct pseudocode
        ↓
Recover accepted input
        ↓
State what was observed vs inferred
```

The expanded binary is stripped and PIE-enabled, so students must rely more on structure, imported functions, and control flow instead of convenient symbols or a plaintext comparison string.

## Guided Commands

Build:

```bash
cd challenge
./build.sh
```

Identify:

```bash
file training-bin
```

Strings:

```bash
strings training-bin
```

ELF metadata:

```bash
readelf -h training-bin
readelf -s training-bin
```

Disassembly:

```bash
objdump -d training-bin | less
```

Protections:

```bash
checksec --file=training-bin
```

radare2 metadata:

```bash
rabin2 -I training-bin
rabin2 -z training-bin
```

GDB:

```bash
gdb ./training-bin
```

Members should focus on understanding behavior, not turning this event into an exploitation lab.

The intended result is:

```text
binary behavior
→ validation pseudocode
→ accepted input
```

not a crash, shell, or control-flow exploit.

## Challenge

See:

```text
challenge/README.md
```

## Next Event

[Intermediate 12 — Intermediate CTF](../12-intermediate-ctf/)
