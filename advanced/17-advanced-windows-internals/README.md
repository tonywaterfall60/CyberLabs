# Advanced 17 — Advanced Windows Internals

## Event Snapshot

| Item | Details |
|---|---|
| Track | Advanced |
| Difficulty | Advanced |
| Estimated time | 90–120 minutes |
| Environment | Synthetic Windows internals evidence |
| Prerequisites | 16 — Pivoting & Segmented Networks |

## Why This Event Exists

Advanced endpoint analysis benefits from understanding process ancestry, access tokens, integrity levels, services, handles, and persistence-related Windows internals.

## Learning Objectives

- interpret process/token context,
- compare integrity levels,
- distinguish service identity from user identity,
- identify suspicious parent/child relationships,
- connect internals to telemetry and containment.

## Concepts

Review the trust boundaries, evidence relationships, attack/defense assumptions, and control decisions named in the learning objectives.

## Guided Lab

The event lead should model one complete evidence-to-conclusion chain, including an alternative explanation, validation step, and defensive remediation.

## Challenge

[challenge/README.md](challenge/README.md)

## Expected Outcomes

Members should independently form and test hypotheses, support conclusions with evidence, identify limitations, and connect findings to remediation and detection.

## Cleanup

No cleanup is required.

---

## Event Navigation

- Previous: [Pivoting & Segmented Networks](../16-pivoting-segmented-networks/)
- Track Home: [Advanced Track](../README.md)
- Curriculum Index: [All CyberLabs Events](../../CURRICULUM_INDEX.md)
- Next: [Memory Forensics with Training Image](../18-memory-forensics-training-image/)
