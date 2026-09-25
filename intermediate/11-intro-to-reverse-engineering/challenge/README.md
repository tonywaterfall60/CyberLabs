# Challenge — Analyze the Toy Binary

**Difficulty:** Intermediate  
**Estimated time:** 90–120 minutes

## Goal

Analyze a stripped local ELF, reconstruct the validation logic, and determine what input reaches the success path.

Do not treat this as an exploitation lab.

## Build

~~~bash
chmod +x build.sh
./build.sh
~~~

Analyze:

~~~text
training-bin
~~~

## Required Workflow

### 1 — Identify

~~~bash
file training-bin
checksec --file=training-bin
~~~

Record architecture, linking, PIE, NX, and stack-canary state.

### 2 — Low-Cost Static Analysis

~~~bash
strings training-bin | less
rabin2 -I training-bin
rabin2 -z training-bin
~~~

Identify useful strings and metadata.

### 3 — Imports and Disassembly

~~~bash
readelf -d training-bin
objdump -T training-bin
objdump -d -M intel training-bin | less
~~~

Look for evidence of:

- input length checking,
- individual character checks,
- repeated byte-processing logic,
- a final constant comparison,
- success/failure branches.

### 4 — Run Normally

Try several harmless inputs.

Record how program behavior changes.

### 5 — Dynamic Analysis

Use GDB or radare2.

Because the binary is stripped and PIE-enabled, do not rely on a copied absolute address.

Useful GDB concepts:

~~~text
starti
break __libc_start_main
info functions
disassemble
info registers
x/s
~~~

### 6 — Reconstruct Logic

Write pseudocode in your own words.

Your pseudocode should describe:

~~~text
length check
fixed-position checks
loop/transformation
final comparison
success branch
~~~

### 7 — Recover Accepted Input

Derive the accepted phrase from the evidence.

Brute force is not the intended solution.

## Deliverable

~~~text
Architecture:
Linking:
Protections:
Useful imports:
Useful strings:

Validation pseudocode:
Accepted input:

Static evidence:
Dynamic evidence:
Observed:
Inferred:
Unknown:

Difference between reversing and exploitation:
~~~