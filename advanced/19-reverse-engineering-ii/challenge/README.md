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

Use only disassembly.txt and strings.txt.

## Setup

No binary execution is required.

## Investigation / Tasks

Identify the input-length check, per-byte transformation, loop termination, final accumulator comparison, and success/failure branch.

Write pseudocode and derive what constraints a valid input must satisfy.

Do not assume visible strings are directly compared.

## Deliverable

Submit pseudocode, control-flow explanation, derived constraints, validation evidence, and remaining uncertainty.

## Cleanup

No cleanup is required.
