# Beginner 13 — Windows Fundamentals for Cybersecurity

## Event Snapshot

| Item | Details |
|---|---|
| Track | Beginner |
| Difficulty | Beginner |
| Estimated time | 75–90 minutes |
| Environment | Kali Linux / local CyberLabs environment |
| Prerequisites | Cybersecurity Lab Safety & Scoping |

## Why This Event Exists

CyberLabs is Kali-heavy, so this event gives beginners the Windows vocabulary they need for later Windows security and DFIR work.

## Learning Objectives

- identify users, processes, services, connections, and scheduled tasks from provided Windows-style output
- explain the difference between a process and a service
- recognize common Windows paths and security contexts
- use PowerShell-style output as evidence

## Concepts

- **Processes:** Running program instances.
- **Services:** Background components managed by the Service Control Manager.
- **Registry:** Hierarchical configuration database.
- **Event logs:** Structured Windows telemetry.
- **PowerShell:** Administrative shell and scripting environment.

## Guided Lab

Use the local challenge in `challenge/`. Start by identifying scope, then collect evidence, explain what it means, identify uncertainty, and recommend a safe next step.

### Tools

- provided PowerShell-style evidence
- grep/less for local analysis

## Challenge

[Open the challenge](challenge/README.md)

## Flags

This event contains **2 challenge flags**: one for locating the important Windows evidence and one for interpreting process, task, user, and connection context.

## Expected Outcomes

Members should be able to explain the topic in their own words and support conclusions with specific local evidence.

## Cleanup

Follow the challenge-specific cleanup section.

---

## Event Navigation

- Previous: [Cybersecurity Lab Safety & Scoping](../12-cybersecurity-lab-safety-scoping/)
- Track Home: [Beginner Track](../README.md)
- Curriculum Index: [All CyberLabs Events](../../CURRICULUM_INDEX.md)
- Next: [Identity & Access Basics](../14-identity-access-basics/)
