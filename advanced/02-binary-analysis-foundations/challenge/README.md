# Challenge — Characterize the Crash

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 90–120 minutes |
| Environment | Kali + local toy C/ELF binary |
| Authorized scope | vuln-bin, vuln.c, generated inputs, and hardened comparison build |
| Goal | Characterize memory corruption evidence without overstating exploitability |
## Authorized Scope

Only the provided local toy binary:

~~~text
vuln-bin
~~~

Do not reuse the workflow against unrelated software.

## Scenario

Determine exactly what has been demonstrated: safe execution, memory corruption, a crash, or evidence of controlled state.

Do not jump directly from `segmentation fault` to `exploitable`.

## Setup

Use the local build and generated inputs only.

## Objectives / Tasks

### Phase 1 — Build and Baseline

~~~bash
chmod +x prepare-flags.sh build.sh generate-inputs.py
./prepare-flags.sh
./build.sh
file vuln-bin
checksec --file=vuln-bin
~~~

Run with a short input and record normal behavior.

### Phase 2 — Source and Binary Review

Inspect `vuln.c` and the compiled binary.

Identify:

- local buffer size,
- unsafe copy operation,
- compiler protections intentionally disabled by build.sh,
- protections that still exist.

### Phase 3 — Controlled Input Set

Generate labeled local test inputs:

~~~bash
python3 generate-inputs.py
ls -lh inputs/
~~~

Test the files from shortest to longest.

Record:

~~~text
Input length
Program result
Exit code
Crash? yes/no
~~~

Your goal is to identify the approximate transition from normal processing to corruption/crash.

After documenting the crash threshold and GDB evidence without overstating control, inspect `runtime/crash-note.txt` and record the first dashboard flag.

### Phase 4 — GDB Crash Characterization

Open:

~~~bash
gdb ./vuln-bin
~~~

Use a crashing local input and inspect:

~~~text
backtrace
info registers
x/32gx $rsp
disassemble process
~~~

Answer:

- Where did execution fail?
- Is the instruction pointer obviously controlled?
- Which stack values contain recognizable input bytes?
- What evidence supports only a crash versus stronger control?

### Phase 5 — Pattern Experiment

`inputs/pattern.txt` contains a recognizable repeating pattern.

Use it only to make corrupted bytes easier to identify in GDB.

Do not build a payload or redirect execution in this event.

### Phase 6 — Compare Builds

Build a hardened comparison binary:

~~~bash
gcc -O2 -fstack-protector-strong -D_FORTIFY_SOURCE=2 -fPIE -pie -o hardened-bin vuln.c
checksec --file=hardened-bin
~~~

Compare behavior and protections.

Explain which controls reduce exploitability and which source bug still remains.

After completing the hardened-build comparison and root-cause remediation analysis, inspect `runtime/mitigation-note.txt` and record the second dashboard flag.

### Phase 7 — Remediation

Propose at least two source-level changes and two build/runtime mitigations.

Separate:

~~~text
Fixes the root bug
Reduces exploitability
Improves detection/diagnostics
~~~

## Deliverable

~~~text
Architecture:
Linking:
Protections:
Unsafe pattern:

Normal-input result:
Approximate crash threshold:
GDB evidence:
Instruction-pointer control demonstrated? yes/no/uncertain
Why:

Hardened-build differences:
Root-cause fixes:
Exploitability mitigations:
Detection/diagnostic ideas:
Remaining uncertainty:
~~~

Submit both discovered flags to the CyberLabs dashboard.

## Cleanup

Remove locally generated binaries, input files, and `runtime/` if you want to reset the challenge.