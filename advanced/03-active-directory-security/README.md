# Advanced 03 — Active Directory Security

**Difficulty:** Advanced  
**Estimated time:** 120 minutes  
**Prerequisites:** Intermediate Windows privilege foundations  
**Environment:** Kali Linux; local exported dataset now, shared AD range later

## Learning Objectives

Students should be able to:

- explain core AD objects and relationships
- reason about groups, delegated rights, SPNs, trusts, and privileged accounts
- identify likely attack paths from exported data
- distinguish exposure from exploitability
- recommend identity hardening
- explain what BloodHound-style graph analysis adds

## Local-Only Version

Until a shared domain lab exists, use the fictional challenge dataset under:

```text
challenge/
```

Tools:

- grep
- awk
- jq
- Python
- optional graphing tools

## Shared-Range Upgrade

When a club AD range exists, this event can add:

- BloodHound
- bloodhound-python
- ldapsearch
- Kerberos/LDAP enumeration
- domain group analysis

Those additions should target only the club-owned domain.

## Challenge

```bash
cd challenge
cat README.md
```

## Deliverable

Produce:

- privileged-group map
- risky relationship list
- likely attack path
- evidence for each step
- remediation priorities
- uncertainty/validation needs

## Next Event

[Advanced 04 — Malware Analysis](../04-malware-analysis/)
