# Advanced 02 — Binary Analysis Foundations

**Difficulty:** Advanced  
**Estimated time:** 120 minutes  
**Prerequisites:** Intermediate Reverse Engineering  
**Environment:** Kali Linux, GCC, GDB, checksec, radare2/Ghidra

## Learning Objectives

Students should be able to:

- inspect ELF metadata and protections
- recognize unsafe C patterns
- reproduce and characterize a crash
- inspect stack state in GDB
- explain the difference between crash, control, and exploitability
- recommend compiler and source-level mitigations

## Tools

- file
- strings
- readelf
- objdump
- checksec
- GDB
- radare2 / Ghidra
- optional pwndbg/GEF

## Challenge

```bash
cd challenge
./build.sh
cat README.md
```

The challenge is an intentionally vulnerable local toy binary.

This event stops at crash/control analysis; the dedicated Exploit Development event later goes further.

## Deliverable

```text
Architecture:
Protections:
Unsafe function/pattern:
Crash conditions:
Observed register/stack state:
Exploitability questions:
Source mitigation:
Compiler/runtime mitigation:
```

## Next Event

[Advanced 03 — Active Directory Security](../03-active-directory-security/)
