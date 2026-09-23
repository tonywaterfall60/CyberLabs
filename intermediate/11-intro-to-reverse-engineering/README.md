# Intermediate 11 — Intro to Reverse Engineering

**Difficulty:** Intermediate  
**Estimated time:** 90 minutes  
**Prerequisites:** Linux + Python + command-line comfort  
**Environment:** GCC, `file`, `strings`, `readelf`, `objdump`; optional Ghidra

## Learning Objectives

Members should be able to:

- identify binary type and architecture
- inspect strings and imported functions
- distinguish static from dynamic analysis
- describe basic program flow
- explain why compiler protections matter
- document observations before attempting deeper analysis

## Workflow

```text
Identify file
  ↓
Inspect metadata
  ↓
Inspect strings/imports
  ↓
Run normally
  ↓
Observe behavior
  ↓
Form hypotheses
```

## Challenge

```bash
cd challenge
./build.sh
cat README.md
```

The provided toy program is local and intentionally simple.

## Next Event

[Intermediate 12 — Intermediate CTF](../12-intermediate-ctf/)
