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

## Windows Privilege Review Model

```text
Current identity/token
      ↓
Groups and privileges
      ↓
Services and scheduled tasks
      ↓
Filesystem/registry permissions
      ↓
Credentials/configuration
      ↓
Privilege boundary relationship
      ↓
Validation and remediation
```

Important:

```text
interesting privilege != confirmed escalation path
```

For example, `SeImpersonatePrivilege` is a lead that needs context and validation. An unquoted service path also needs writable path conditions before it becomes a stronger finding.

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

Identify at least five review items.

For each provide:

```text
Evidence:
Privilege level involved:
User-controlled element:
Why it matters:
Validation required:
Remediation:
Priority:
```

Rank the top three.

Also explain one item that appears interesting but still needs more evidence before you would call it a confirmed privilege-escalation weakness.

## Next Event

[Intermediate 07 — Packet Analysis Challenge](../07-packet-analysis/)
