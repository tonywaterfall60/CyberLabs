# Advanced 15 — SSRF & Internal Trust Boundaries

## Event Snapshot

| Item | Details |
|---|---|
| Track | Advanced |
| Difficulty | Advanced |
| Estimated time | 90–120 minutes |
| Environment | Synthetic architecture + HTTP evidence |
| Prerequisites | 14 — Web Exploitation Chaining |

## Why This Event Exists

SSRF is fundamentally a trust-boundary problem: a server may reach resources that a client cannot.

## Learning Objectives

- model outbound trust boundaries,
- identify server-side request behavior,
- distinguish reachability from authorization,
- evaluate destination validation,
- recommend egress and service-authentication controls.

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

- Previous: [Web Exploitation Chaining](../14-web-exploitation-chaining/)
- Track Home: [Advanced Track](../README.md)
- Curriculum Index: [All CyberLabs Events](../../CURRICULUM_INDEX.md)
- Next: [Pivoting & Segmented Networks](../16-pivoting-segmented-networks/)
