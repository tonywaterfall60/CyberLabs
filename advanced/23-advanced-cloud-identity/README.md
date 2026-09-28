# Advanced 23 — Advanced Cloud Identity

## Event Snapshot

| Item | Details |
|---|---|
| Track | Advanced |
| Difficulty | Advanced |
| Estimated time | 90–120 minutes |
| Environment | Static/synthetic enterprise security evidence |
| Prerequisites | SIEM Engineering |

## Why This Event Exists

Cloud identity failures often come from trust relationships, role assumption, service principals, and long-lived credentials rather than a single broad IAM action.

## Learning Objectives

- map human, workload, role, and service identities
- analyze role-assumption trust policies
- separate permission from trust
- correlate identity actions with audit events
- recommend least-privilege and credential-lifecycle controls

## Concepts

Focus on trust boundaries, evidence quality, competing explanations, prevention, detection, and residual risk.

## Guided Lab

The event lead should model one evidence-to-conclusion chain, then require members to independently validate the remaining relationships.

## Challenge

[challenge/README.md](challenge/README.md)

## Expected Outcomes

Members should produce an evidence-backed technical assessment rather than a checklist of configuration issues.

## Cleanup

No cleanup is required unless the challenge creates optional local output files.

---

## Event Navigation

- Previous: [SIEM Engineering](../22-siem-engineering/)
- Track Home: [Advanced Track](../README.md)
- Curriculum Index: [All CyberLabs Events](../../CURRICULUM_INDEX.md)
- Next: [Kubernetes Security](../24-kubernetes-security/)
