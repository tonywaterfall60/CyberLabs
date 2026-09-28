# Extra Practice 29 — Red-Team Assessment Capstone

## Lab Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced Capstone |
| Estimated time | 3–4 hours |
| Environment | Kali Linux + Docker |
| Infrastructure | Isolated multi-host assessment subnet |
| Tools | Nmap, curl, Burp, jq, reporting methodology |

## Scenario

You are given only a written authorization and a subnet. Perform a professional, evidence-driven assessment of the fictional range and demonstrate access to the protected training artifact.

## Authorized Scope

~~~text
172.28.29.0/28
~~~

Rules:

- no denial of service,
- no attacks outside the subnet,
- no password brute force,
- no destructive actions,
- stop after objective access,
- document all commands.

## Setup

~~~bash
docker compose up --build -d
~~~

## Investigation / Tasks

### Phase 1 — Plan

Write scope, assumptions, success criteria, and initial hypotheses before scanning.

### Phase 2 — Discovery

Identify live hosts and exposed services.

### Phase 3 — Manual Validation

Validate every high-value service manually.

### Phase 4 — Attack Path

The intended path requires combining information exposure with an authorization weakness. Avoid broad guessing.

### Phase 5 — Objective

Retrieve the protected training artifact, record the exact evidence, then stop offensive testing.

### Phase 6 — Reporting

Write both technical findings and a short executive summary.

## Deliverable

Submit:

~~~text
Executive summary
Scope
Methodology
Network map
Attack path
Finding 1
Finding 2
Objective evidence
Risk explanation
Remediation
Detection ideas
Limitations
Cleanup confirmation
~~~

## Cleanup

~~~bash
docker compose down
~~~
