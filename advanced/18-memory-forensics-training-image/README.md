# Advanced 18 — Memory Forensics with a Training Image

## Event Snapshot

| Item | Details |
|---|---|
| Track | Advanced |
| Difficulty | Advanced |
| Estimated time | 90–120 minutes |
| Environment | Volatility-style memory evidence; optional instructor-provided image |
| Prerequisites | 17 — Advanced Windows Internals |

## Why This Event Exists

Memory analysis can connect processes, command lines, sockets, handles, and suspicious memory regions that may not remain on disk.

## Learning Objectives

- preserve acquisition metadata,
- correlate process/network/file artifacts,
- interpret memory findings cautiously,
- distinguish plugin output from conclusion,
- request validation from disk/EDR/log sources.

## Concepts

Review the trust boundaries, evidence relationships, attack/defense assumptions, and control decisions named in the learning objectives.

## Guided Lab

The event lead should model one complete evidence-to-conclusion chain, including an alternative explanation, validation step, and defensive remediation.

## Challenge

[challenge/README.md](challenge/README.md)

## Expected Outcomes

Members should independently form and test hypotheses, support conclusions with evidence, identify limitations, and connect findings to remediation and detection.

## Cleanup

No cleanup is required unless an instructor provides a separate temporary memory image.

---

## Event Navigation

- Previous: [Advanced Windows Internals](../17-advanced-windows-internals/)
- Track Home: [Advanced Track](../README.md)
- Curriculum Index: [All CyberLabs Events](../../CURRICULUM_INDEX.md)
- Next: [Reverse Engineering II](../19-reverse-engineering-ii/)
