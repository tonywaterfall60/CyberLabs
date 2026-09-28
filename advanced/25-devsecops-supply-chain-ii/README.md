# Advanced 25 — DevSecOps / Supply Chain II

## Event Snapshot

| Item | Details |
|---|---|
| Track | Advanced |
| Difficulty | Advanced |
| Estimated time | 90–120 minutes |
| Environment | Static/synthetic enterprise security evidence |
| Prerequisites | Kubernetes Security |

## Why This Event Exists

Advanced supply-chain review goes beyond a weak CI file and asks whether source, dependencies, build identity, artifacts, provenance, and releases can be trusted end to end.

## Learning Objectives

- trace source-to-release trust boundaries
- review SBOM and provenance evidence
- identify unsafe artifact and dependency assumptions
- evaluate CI identity and signing gaps
- design verification gates for release promotion

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

- Previous: [Kubernetes Security](../24-kubernetes-security/)
- Track Home: [Advanced Track](../README.md)
- Curriculum Index: [All CyberLabs Events](../../CURRICULUM_INDEX.md)
- Next: [Incident Command / Major Incident Response](../26-incident-command-major-incident-response/)
