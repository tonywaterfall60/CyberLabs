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

## Intermediate Risk-Analysis Method

Use:

~~~text
Observed behavior
      ↓
Failed trust assumption
      ↓
Security weakness/theme
      ↓
Potential impact
      ↓
Evidence still needed
      ↓
Prevention/remediation
      ↓
Detection/monitoring
      ↓
Confidence
~~~

For each scenario ask:

1. What is directly observed?
2. What are you inferring?
3. What trust assumption failed?
4. Which OWASP-style theme best describes it?
5. What could an attacker gain?
6. What evidence would strengthen or weaken the conclusion?
7. What control reduces the root issue?
8. What logs could detect attempted abuse?

The category name is vocabulary. The analysis is the important part.

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

~~~text
challenge/README.md
~~~

The expanded workshop contains ten findings covering access control, injection, configuration, authentication, logging, outdated components, transport protection, client-side authorization, software integrity, and server-side request risks.

You will also:

- separate evidence from assumption,
- combine two findings into a defensible risk chain,
- prioritize remediation,
- identify cases where more evidence is required.

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
