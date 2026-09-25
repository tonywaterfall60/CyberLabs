# Intermediate 13 — Advanced Capstone Prep

**Difficulty:** Intermediate capstone preparation  
**Estimated review time:** 90–120 minutes  
**Prerequisites:** Intermediate 01–12

## Purpose

This event prepares members for the Intermediate → Advanced mock interview.

Advanced readiness is not measured by how many commands you remember.

It is measured by whether you can take a bounded problem and work through it with a repeatable method:

~~~text
Scope
  ↓
Question / hypothesis
  ↓
Evidence source
  ↓
Tool choice
  ↓
Validation
  ↓
Conclusion
  ↓
Remediation / detection
~~~

## Part 1 — Readiness Self-Score

Score yourself:

~~~text
3 = I can explain it, apply it, and discuss limitations
2 = I understand it but may need prompting
1 = I recognize it but cannot apply it independently
0 = I do not understand it yet
~~~

### Enumeration

- define scope before scanning
- separate discovery from fingerprinting
- manually validate service guesses
- prioritize services by sensitivity/exposure
- explain what an open port does and does not prove

### Web Security

- build an application map
- distinguish query/body/cookie/header input
- use Burp Proxy vs. Repeater appropriately
- explain broken object authorization
- distinguish hidden route from vulnerability
- explain trust boundaries
- recommend server-side remediation

### Password Security

- explain salts
- explain slow password hashing
- compare online vs. offline guessing
- explain MFA and rate limiting
- review password storage and auth policy separately

### Privilege Analysis

- identify higher-privileged execution
- identify lower-user influence
- correlate services/tasks/scripts/permissions
- distinguish a lead from a confirmed path
- prioritize remediation without exploiting the system

### Packet Analysis

- summarize conversations
- filter by host/port/protocol
- follow streams
- extract fields with tshark
- build a timeline
- explain visibility limits

### Log Analysis

- identify shared correlation keys
- trace a user/session across logs
- build multi-source timelines
- identify impact
- state observed / inferred / unknown

### OSINT

- define a collection question
- record provenance
- corroborate claims
- avoid overclaiming

### Python

- parse structured text
- use Counter/dictionaries/defaultdict
- correlate events
- handle imperfect input
- explain when automation is appropriate

### Reverse Engineering

- identify binary type/protections
- inspect strings/imports
- use static and dynamic analysis
- reconstruct high-level logic
- distinguish reversing from exploitation

---

## Part 2 — Rapid Practice Questions

Answer each in 45–90 seconds.

1. Nmap identifies HTTP on an unexpected port. What do you do next and why?
2. Gobuster finds `/admin` returning 403. What does that prove?
3. Why is changing one parameter at a time useful in Burp Repeater?
4. Why is SHA-256 poor for password storage even though it is cryptographically strong?
5. What does a unique salt change? What does it not change?
6. Why is `SeImpersonatePrivilege` a lead rather than proof?
7. What makes a root/SYSTEM process using a user-writable script dangerous?
8. What can a PCAP prove about a request, and what user identity may remain unknown?
9. How would you correlate failed logins with later application activity?
10. When should you automate an analysis task?
11. What does `strings` tell you about a binary, and what can it not prove?
12. Why use both static and dynamic analysis?
13. What makes a scanner finding stronger?
14. What should remediation guidance contain?
15. What should you verify before touching any target?

---

## Part 3 — Multi-Source Practice Scenario

Use the synthetic case in:

~~~text
PRACTICE_CASE.md
~~~

Spend five minutes planning before choosing tools.

Your plan must contain:

~~~text
Scope:
First question:
Evidence source:
Tool:
Expected useful result:
How you will validate:
Potential finding:
Alternative explanation:
Next evidence needed:
~~~

Do not try to solve every possible issue at once.

---

## Part 4 — Practical Evidence Drill

Use one existing Intermediate or Extra Practice lab.

Complete all four tasks:

### A — Automated Result + Manual Validation

Run one automated tool such as Nmap, Gobuster/ffuf, hashid, or a parser.

Then manually validate one result.

Write:

~~~text
Automated observation:
Manual validation:
Did the interpretation change?
~~~

### B — Timeline

Build a timeline from at least two sources.

### C — Uncertainty

Write one conclusion you **cannot** make from the available evidence.

### D — Remediation + Detection

For one finding provide:

~~~text
Root-cause remediation:
Useful detection/monitoring:
Residual risk:
~~~

---

## Part 5 — Tool-Choice Exercise

Choose the first tool/evidence source and explain why.

| Question | First tool/evidence | Why? | Validation |
|---|---|---|---|
| Which authorized ports are open? | | | |
| What does this web service actually return? | | | |
| Which hidden routes exist? | | | |
| What happened in this TCP conversation? | | | |
| Which user/session performed an export? | | | |
| Which files contain a suspicious string? | | | |
| What does this ELF import? | | | |
| Which source generated the most failures? | | | |

---

## Part 6 — Advanced Readiness Standard

You are ready for Advanced when you can usually do the following without being handed the exact command:

- state scope before acting
- turn a vague problem into a specific investigation question
- choose a tool or evidence source for a reason
- validate automated output manually
- combine evidence from more than one source
- distinguish observation from inference
- state uncertainty explicitly
- identify missing telemetry
- connect technical evidence to impact
- recommend both remediation and detection
- stop when the available evidence or authorization does not justify further testing

Advanced does **not** mean:

~~~text
run more aggressive tools
scan more targets
copy exploit commands faster
claim certainty from scanner output
~~~

It means stronger methodology and deeper systems reasoning.

---

## Part 7 — Readiness Reflection

Complete before the mock interview:

~~~text
My strongest Intermediate domain:
My weakest Intermediate domain:

One example where I validated an automated result:
One example where evidence changed my original assumption:
One example where I had to say 'unknown':

One multi-source correlation I can explain:
One remediation I can explain at root-cause level:
One detection idea I can explain:

One tool I can use independently:
One tool I still rely on instructions for:

How I verify scope:
How I decide when to stop testing:
~~~

## Recommended Review

If any section scores mostly 0–1, use the matching material under:

~~~text
intermediate/
Extra Practice/
~~~

Good review labs include:

- Extra Practice 04 — Packet Investigation
- Extra Practice 05 — Authentication Incident
- Extra Practice 07 — Reverse Engineering Drill
- Extra Practice 08 — Purple-Team Mini Range
- Extra Practice 09 — SIEM / Detection Investigation
- Extra Practice 11 — Full Incident Response Case
- Extra Practice 14 — Multi-Host Cyber Range Investigation

---

## Interview Answer Framework

A strong answer often sounds like:

~~~text
First I would confirm the scope and what question I am answering.

I would use <tool/evidence> because it can tell me <specific thing>.

If I observed <evidence>, I would interpret it as <meaning>,
but I would not yet conclude <unsupported claim>.

I would validate it by <manual/second-source validation>.

To strengthen the conclusion, I would ask for <missing evidence>.

The root-cause fix would be <remediation>,
and I would monitor for <detection idea>.
~~~

## After Passing

Continue with:

~~~text
advanced/01-advanced-web-security
~~~