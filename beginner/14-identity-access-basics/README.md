# Beginner 14 — Identity & Access Basics

## Event Snapshot

| Item | Details |
|---|---|
| Track | Beginner |
| Difficulty | Beginner |
| Estimated time | 60–75 minutes |
| Environment | Kali Linux / local CyberLabs environment |
| Prerequisites | Windows Fundamentals for Cybersecurity |

## Why This Event Exists

Authentication and authorization failures appear throughout CyberLabs. This event builds a clear beginner mental model before deeper web and enterprise labs.

## Learning Objectives

- distinguish identity, authentication, authorization, and accounting
- explain MFA and session concepts
- identify least-privilege failures in simple scenarios
- recognize the difference between a stolen password and a stolen session

## Concepts

- **Authentication:** Proves who a user is.
- **Authorization:** Determines what an authenticated identity may do.
- **Session:** Represents authenticated state after login.
- **MFA:** Requires more than one factor category.
- **Least privilege:** Grants only the access required.

## Guided Lab

Use the local challenge in `challenge/`. Start by identifying scope, then collect evidence, explain what it means, identify uncertainty, and recommend a safe next step.

### Tools

- local JSONL authentication evidence
- jq or cat

## Challenge

[Open the challenge](challenge/README.md)

## Expected Outcomes

Members should be able to explain the topic in their own words and support conclusions with specific local evidence.

## Cleanup

Follow the challenge-specific cleanup section.

---

## Event Navigation

- Previous: [Windows Fundamentals for Cybersecurity](../13-windows-fundamentals/)
- Track Home: [Beginner Track](../README.md)
- Curriculum Index: [All CyberLabs Events](../../CURRICULUM_INDEX.md)
- Next: [Intro to Wireless Security](../15-intro-wireless-security/)
