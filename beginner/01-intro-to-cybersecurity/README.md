# Beginner 01 — Intro to Cybersecurity

**Difficulty:** Beginner  
**Estimated time:** 60–75 minutes  
**Prerequisites:** None  
**Environment:** No VM required

## Why This Event Exists

This event gives new members the vocabulary and mental model they will use throughout the rest of the club. The goal is not to memorize definitions; it is to understand what cybersecurity is protecting, what can go wrong, and how security decisions are made.

## Learning Objectives

By the end of the event, members should be able to:

- explain confidentiality, integrity, and availability
- distinguish a threat, vulnerability, risk, and mitigation
- explain authentication vs. authorization
- identify an attack surface
- explain why authorization and scope matter before testing a system
- think about security from both attacker and defender perspectives

## Core Concepts

### CIA Triad

**Confidentiality** — information is only accessible to authorized people or systems.

**Integrity** — information and systems remain accurate and are not changed without authorization.

**Availability** — systems and data are accessible when needed.

### Threat, Vulnerability, and Risk

A useful model:

```text
Threat + Vulnerability + Potential Impact → Risk
```

Example:

```text
Threat: attacker steals credentials
Vulnerability: password reuse
Impact: unauthorized account access
Mitigation: unique passwords + MFA
```

### Authentication vs. Authorization

```text
Authentication = Who are you?
Authorization  = What are you allowed to do?
```

A system may authenticate a user correctly but still have broken authorization.

### Attack Surface

The attack surface includes the places where a system can be interacted with, such as:

- web applications
- APIs
- login pages
- open network services
- email
- cloud services
- physical devices
- employees and processes

## Guided Activity — Security Scenario Analysis

For each scenario identify:

1. asset
2. threat
3. vulnerability
4. possible impact
5. affected CIA property
6. one mitigation

### Scenario A — Password Reuse

A student uses the same password for school email, social media, and a shopping website.

### Scenario B — Broken Access Control

A normal user changes a number in a URL and can view another user's private account information.

### Scenario C — Untested Backups

An organization makes nightly backups but has never attempted to restore them.

### Scenario D — Shared Administrator Account

Five employees share one administrator username and password.

### Scenario E — Unpatched Public Server

A public-facing server has not received security updates in more than a year.

## Discussion — Attacker and Defender Thinking

For one scenario, answer both:

**Attacker perspective**
- What would be valuable?
- What weakness could be abused?

**Defender perspective**
- What control could prevent the issue?
- What logs or alerts might detect it?
- How could impact be reduced?

## Beginner Analysis Method

Use the same sequence for every security scenario:

~~~text
What are we protecting?
        ↓
What could go wrong?
        ↓
What weakness makes that possible?
        ↓
What would the impact be?
        ↓
Which control reduces the risk?
        ↓
How would we know if it happened?
~~~

This structure matters more than memorizing terminology.

## Challenge

Complete:

~~~text
challenge/README.md
~~~

The expanded Security Triage Case File contains five incidents with additional context.

For each one, students now identify:

- asset,
- threat,
- vulnerability,
- impact,
- CIA effect,
- authentication vs. authorization,
- preventive control,
- detection idea,
- recovery/response action,
- confidence.

Students also prioritize the incidents and compare attacker/defender perspectives.

## Deliverable

Submit or discuss the completed challenge template for all five cases plus one attacker/defender analysis.

A strong Beginner answer explains **why** a term applies rather than only naming it.

## Key Takeaway

Cybersecurity is not just exploitation. It includes prevention, detection, response, recovery, policy, engineering, and responsible decision-making.

## Next Event

[Beginner 02 — Linux Basics](../02-linux-basics/)
