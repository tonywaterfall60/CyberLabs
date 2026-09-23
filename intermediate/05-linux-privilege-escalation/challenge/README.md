# Challenge — Linux Privilege Audit

Run:

```bash
./setup.sh
```

A fictional Linux host snapshot is created under:

```text
~/cyberclub/linux-privesc-audit
```

## Tasks

Review the files and identify at least four risky conditions.

Look for:

- overly permissive files
- exposed credentials
- risky sudo rules
- privileged scheduled tasks that reference writable files
- suspicious service configuration

## Rules

Do not change your real sudoers, cron, service, or system configuration. Everything needed is represented as text files inside the challenge directory.

## Deliverable

For each issue:

```text
File/evidence:
Risk:
How privilege could be affected:
Remediation:
```

## Cleanup

```bash
./reset.sh
```
