# Challenge — Web Risk Classification and Evidence Review

**Difficulty:** Intermediate  
**Estimated time:** 60–90 minutes

## Goal

For each fictional finding, identify the most relevant security theme, explain what evidence supports it, describe potential impact, and recommend prevention plus detection.

Do not treat the OWASP category name as the entire answer.

## Analysis Template

~~~text
Finding:
Observed evidence:
Likely OWASP theme:
Trust assumption that failed:
Potential impact:
Evidence still needed:
Prevention/remediation:
Useful logging/detection:
Confidence:
~~~

## Finding 1 — Cross-Student Grade Access

An authenticated student changes `/grades/1201` to `/grades/1202` and sees another student's record.

## Finding 2 — Query Construction

A search feature directly concatenates user-provided text into a database query without parameterization.

## Finding 3 — Verbose Production Debugging

A production application exposes stack traces, framework version details, and environment configuration after an error.

## Finding 4 — Weak Administrative Authentication

Administrative accounts do not require MFA and allow unlimited password attempts.

## Finding 5 — Missing Audit Trail

A critical administrative action succeeds, but no log records which account performed it.

## Finding 6 — Outdated Dependency

A dependency is several years out of date and has published security fixes that have not been applied.

## Finding 7 — Sensitive Data over Plain HTTP

An internal application sends session cookies and employee data over unencrypted HTTP across a shared network.

## Finding 8 — Client-Side Authorization

The browser hides an `Approve Refund` button from normal users, but the server accepts the same request when it is sent manually.

## Finding 9 — Unsigned Build Artifact

A deployment system downloads a build artifact from shared storage but performs no signature or integrity verification before deployment.

## Finding 10 — Server Fetch Feature

A PDF-generation feature accepts a URL from the user and the server retrieves that URL on the user's behalf. The application does not restrict destination addresses.

## Part 2 — Evidence vs. Assumption

Choose three findings and write:

~~~text
What is directly observed?
What is inferred?
What additional test/evidence would confirm the issue?
~~~

## Part 3 — Chained Risk

Choose two findings that could combine into greater risk.

Explain the chain step-by-step without inventing missing facts.

## Part 4 — Prioritization

Pick your top three findings to remediate first.

Use:

~~~text
Exposure
Data/system sensitivity
Ease of misuse
Blast radius
Existing controls
Evidence quality
~~~

## Deliverable

Complete the analysis template for all ten findings plus:

- one chained-risk analysis,
- top-three remediation priority,
- one example where more evidence is required before making a strong claim.