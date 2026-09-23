# Intermediate 03 — OWASP Top 10 Workshop

**Difficulty:** Intermediate  
**Estimated time:** 90 minutes  
**Prerequisites:** Intermediate 02  
**Environment:** Browser, curl, local challenge files

## Why This Event Exists

The OWASP Top 10 provides a common vocabulary for discussing major web application security risks. This event focuses on recognizing risky design patterns, understanding impact, and recommending mitigations.

## Learning Objectives

Members should be able to:

- explain the purpose of the OWASP Top 10
- recognize common access-control, injection, authentication, configuration, and logging problems
- distinguish vulnerability category from exploit technique
- explain impact in plain language
- recommend appropriate controls
- document evidence without overstating conclusions

## Core Categories to Emphasize

Rather than memorizing every edition number, focus on recurring themes:

- broken access control
- cryptographic failures
- injection
- insecure design
- security misconfiguration
- vulnerable/outdated components
- authentication failures
- software/data integrity failures
- logging/monitoring failures
- server-side request risks

## Guided Analysis

For each scenario ask:

1. What trust assumption failed?
2. What category best describes the issue?
3. What could an attacker gain?
4. What evidence would confirm the issue?
5. What control would reduce the risk?
6. What logs could help detect abuse?

## Example

A normal user changes:

```text
/account/1001
```

to:

```text
/account/1002
```

and can view another user's data.

Likely theme:

```text
Broken access control
```

## Challenge

Open:

```text
challenge/README.md
```

You will classify a set of fictional application findings and write concise remediation guidance.

## Deliverable

For each finding:

```text
Finding:
Likely category:
Evidence:
Potential impact:
Recommended mitigation:
Detection/logging idea:
```

## Next Event

[Intermediate 04 — Password Security](../04-password-security/)
