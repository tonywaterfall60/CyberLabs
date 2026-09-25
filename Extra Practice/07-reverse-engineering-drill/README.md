# Extra Practice 07 — Reverse Engineering Drill

**Difficulty:** Intermediate → Advanced  
**Estimated time:** 90–120 minutes  
**Environment:** Kali Linux  
**Tools:** file, sha256sum, strings, readelf, objdump, checksec, GDB, rabin2/radare2; optional Ghidra  
**Infrastructure:** precompiled stripped x86-64 ELF decoded locally from a repository artifact

## Scenario

A small access-validation utility was recovered from a training system.

You do not have the source code.

Your task is to determine what kind of binary it is, which libraries/functions it relies on, what input reaches the success path, how the validation logic works at a high level, and which runtime value is printed after successful validation.

The goal is reverse engineering, not exploitation.

## Scope

Authorized artifact:

~~~text
~/cyberclub/extra-practice/reverse-drill/access-validator
~~~

Do not use the workflow against unrelated software.

## Why the Repository Contains a .b64 File

Git-based curriculum distribution works best with text artifacts.

The repository contains access-validator.b64. The setup script decodes it into the actual ELF binary.

Treat the decoded ELF as the challenge artifact.

## Setup

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/extra-practice/reverse-drill
ls -lh
~~~

## Phase 1 — Identify the Artifact

~~~bash
file access-validator
sha256sum access-validator
checksec --file=access-validator
~~~

Record architecture, ELF type, PIE status, NX, stack canary, and whether symbols appear stripped.

## Phase 2 — Low-Cost Static Analysis

~~~bash
strings access-validator | less
~~~

Identify prompts, success/failure messages, environment-variable names, and useful imported functions.

Do not assume every visible string is directly compared with user input.

## Phase 3 — ELF Metadata

~~~bash
readelf -h access-validator
readelf -d access-validator
objdump -T access-validator
~~~

Answer whether the file is dynamically or statically linked, which libc functions are imported, and which imports might participate in validation.

## Phase 4 — Disassembly

~~~bash
objdump -d -M intel access-validator | less
radare2 -A access-validator
~~~

Optional:

~~~bash
rabin2 -I access-validator
rabin2 -z access-validator
~~~

Look for logic associated with input length, character checks, a loop over input bytes, a final numeric comparison, and success/failure branches.

Create pseudocode in your own words. Perfect decompilation is not required.

## Phase 5 — Dynamic Analysis

Run the program with an incorrect phrase, then open:

~~~bash
gdb ./access-validator
~~~

Useful commands may include starti, break __libc_start_main, run, info functions, disassemble, x/s, and info registers.

Because the binary is stripped and PIE-enabled, addresses may change between runs. Use relative structure and call behavior rather than relying on one copied address.

## Phase 6 — Recover the Accepted Phrase

Use static and dynamic evidence to derive the phrase that reaches:

~~~text
Access accepted.
~~~

The phrase is local challenge data.

## Phase 7 — Private Flag

After successful validation, the program reads:

~~~text
EXTRA_REVERSE_FLAG
~~~

During instructor-run sessions, the event lead may inject a private SRU flag.

If no private flag is configured, successful validation prints:

~~~text
FLAG_NOT_CONFIGURED
~~~

Finding the accepted phrase and explaining the validation routine are the real objectives.

## Deliverable

~~~text
SHA-256:
Architecture:
ELF type:
Protections:
Useful imports:
Useful strings:

Validation pseudocode:

Accepted phrase:
Evidence used to derive it:

Static-analysis observations:
Dynamic-analysis observations:

What the binary does after success:
What remains uncertain:
~~~

## Cleanup

~~~bash
./reset.sh
~~~