# Challenge — Reconstruct Multi-Stage Validation

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 75–90 minutes |
| Environment | Synthetic reversing evidence |
| Authorized scope | disassembly.txt and strings.txt |
| Goal | Reconstruct validation pseudocode |

## Scenario

A synthetic reversing exercise provides disassembly and strings from a multi-stage validator without the original source.

## Authorized Scope

Use only `disassembly.txt`, `strings.txt`, and the generated local workspace.

## Setup

The event lead loads the private flag registry, then creates the local reversing workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/advanced-re2
~~~

No binary execution is required.

## Investigation / Tasks

Identify the input-length check, per-byte transformation, loop termination, final accumulator comparison, and success/failure branch.

Write pseudocode and derive what constraints a valid input must satisfy.

After reconstructing the length check, loop, XOR transformation, accumulator, comparison, and success branch, inspect `logic-note.txt` and record the first dashboard flag.

After deriving the valid-input constraint without assuming the visible strings are directly compared, inspect hidden files in the workspace and record the second dashboard flag.

Do not assume visible strings are directly compared.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus pseudocode, control-flow explanation, derived constraints, validation evidence, and remaining uncertainty.

## Cleanup

~~~bash
./reset.sh
~~~
