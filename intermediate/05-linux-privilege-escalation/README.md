# Intermediate 05 — Linux Privilege Escalation Foundations

**Difficulty:** Intermediate  
**Estimated time:** 90 minutes  
**Prerequisites:** Linux Basics, Command Line, Intermediate 01  
**Environment:** Linux/WSL; static challenge snapshot

## Why This Event Exists

Privilege escalation often begins with identifying unsafe permissions, overly broad sudo rights, exposed secrets, weak service configuration, or dangerous scheduled tasks. This event teaches members how to audit for those conditions before introducing exploitation.

## Learning Objectives

Members should be able to:

- explain user vs. root privilege
- inspect file ownership and permissions
- understand SUID conceptually
- interpret sudo policy examples
- identify writable sensitive scripts
- identify exposed credentials/secrets
- explain how cron/service misconfiguration can increase risk
- recommend remediation

## Audit Mindset

```text
Who am I?
  ↓
What groups/rights do I have?
  ↓
What runs with higher privilege?
  ↓
What can I modify?
  ↓
What secrets are exposed?
  ↓
What should be fixed?
```

## Useful Commands

```bash
id
groups
ls -la
find
grep
```

In an authorized Linux lab, analysts may also inspect:

```bash
sudo -l
find / -perm -4000 2>/dev/null
```

## Challenge

This event uses a static filesystem/configuration snapshot rather than modifying the member's operating system.

```bash
cd challenge
./setup.sh
cat README.md
```

## Deliverable

For each issue:

```text
Evidence:
Why it matters:
Potential privilege boundary:
Recommended remediation:
```

## Cleanup

```bash
./reset.sh
```

## Next Event

[Intermediate 06 — Windows Privilege Escalation Foundations](../06-windows-privilege-escalation/)
