# Beginner 16 — Intro to Security Monitoring

## Event Snapshot

| Item | Details |
|---|---|
| Track | Beginner |
| Difficulty | Beginner |
| Estimated time | 60–75 minutes |
| Environment | Kali Linux / local CyberLabs environment |
| Prerequisites | Intro to Wireless Security |

## Why This Event Exists

This event shows beginners what defenders actually monitor: authentication, process, network, and application events collected over time.

## Learning Objectives

- identify the purpose of common security telemetry
- build a simple event timeline
- separate a single suspicious event from a correlated sequence
- describe one reasonable detection idea

## Concepts

- **Telemetry:** Recorded activity used for visibility.
- **Alert:** A rule-generated signal that requires validation.
- **Correlation:** Connecting events through fields such as user, host, source, and time.
- **False positive:** Benign behavior that matches a detection condition.

## Guided Lab

Use the local challenge in `challenge/`. Start by identifying scope, then collect evidence, explain what it means, identify uncertainty, and recommend a safe next step.

### Tools

- jq
- grep
- local JSONL events

## Challenge

[Open the challenge](challenge/README.md)

## Expected Outcomes

Members should be able to explain the topic in their own words and support conclusions with specific local evidence.

## Cleanup

Follow the challenge-specific cleanup section.

---

## Event Navigation

- Previous: [Intro to Wireless Security](../15-intro-wireless-security/)
- Track Home: [Beginner Track](../README.md)
- Curriculum Index: [All CyberLabs Events](../../CURRICULUM_INDEX.md)
- Next: [Basic Incident Response](../17-basic-incident-response/)
