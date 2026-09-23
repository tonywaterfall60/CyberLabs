# Intermediate 06 — Windows Privilege Escalation Foundations

**Difficulty:** Intermediate  
**Estimated time:** 90 minutes  
**Prerequisites:** Intermediate 05  
**Environment:** Static Windows configuration snapshot; PowerShell concepts

## Why This Event Exists

Windows privilege escalation often involves service configuration, filesystem permissions, token privileges, scheduled tasks, registry settings, credentials, or weak administrative boundaries. This event teaches members to interpret evidence safely without requiring a vulnerable Windows machine.

## Learning Objectives

Members should be able to:

- explain standard user vs. administrator vs. SYSTEM
- understand service accounts and scheduled tasks
- interpret common Windows enumeration output
- identify unquoted service-path risk conceptually
- identify weak service/file permissions
- identify exposed credentials
- explain why token privileges matter
- recommend remediation

## Useful Windows Enumeration Concepts

```powershell
whoami
whoami /groups
whoami /priv
Get-Service
Get-ScheduledTask
Get-Acl
```

## Challenge

The challenge provides exported text from a fictional Windows workstation.

```text
challenge/
```

Review it as if it came from an authorized endpoint assessment.

## Deliverable

Identify at least four security concerns and provide remediation.

## Next Event

[Intermediate 07 — Packet Analysis Challenge](../07-packet-analysis/)
