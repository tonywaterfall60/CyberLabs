# Extra Practice 11 — Full Incident Response Case

**Difficulty:** Advanced  
**Estimated time:** 2–4 hours  
**Environment:** Kali Linux  
**Tools:** grep/awk/jq, Wireshark/tshark, sha256sum, file, strings, Python optional  
**Infrastructure:** generated case directory + synthetic multi-source logs + offline PCAP + host artifacts

## Scenario

An internal security team is investigating a possible account and endpoint incident involving user `sam` and workstation `WS-17`.

You are given a collected evidence package. You are **not** given a conclusion.

Your job is to reconstruct the incident, identify what is confirmed, identify what remains uncertain, scope the activity, and recommend containment/remediation steps.

## Scope

Generated case directory:

~~~text
~/cyberclub/extra-practice/full-ir-case
~~~

Use only evidence in that directory.

All public IPs/domains are documentation/training values and must not be contacted.

## Case Layout

~~~text
full-ir-case/
├── case-info.txt
├── identity/
│   ├── auth.log
│   └── mfa.jsonl
├── network/
│   ├── dns.log
│   └── incident.pcap
├── endpoint/
│   ├── process.jsonl
│   ├── files.jsonl
│   └── suspicious-update.ps1
├── application/
│   └── access.log
└── evidence-manifest.sha256
~~~

## Investigation Objectives

Determine:

1. what happened first,
2. whether authentication activity is suspicious,
3. whether endpoint behavior aligns with the identity activity,
4. which network events correlate with endpoint activity,
5. whether sensitive application actions occurred,
6. which facts are confirmed versus inferred,
7. likely incident scope,
8. recommended containment and next evidence collection.

## Phase 1 — Preserve and Verify

Start by reviewing:

~~~bash
cat case-info.txt
sha256sum -c evidence-manifest.sha256
~~~

Do not execute suspicious-update.ps1.

## Phase 2 — Identity Timeline

Review auth.log and mfa.jsonl.

Determine whether failures preceded success, whether MFA succeeded, and which source/device/session fields can be correlated.

## Phase 3 — Endpoint Timeline

Review process.jsonl and files.jsonl.

Identify suspicious process relationships, command lines, created files, and timestamps.

Inspect the PowerShell artifact with file, sha256sum, and strings/cat only.

Do not run it.

## Phase 4 — Network Investigation

Review dns.log and incident.pcap.

Use tshark/Wireshark to identify:

- DNS queries
- recurring connections
- HTTP-like activity
- timing relationships with endpoint events

## Phase 5 — Application Impact

Review application/access.log.

Determine whether the user's session accessed or exported sensitive information.

## Phase 6 — Unified Timeline

Build:

~~~text
Timestamp | Evidence Source | User/Host | Event | Observation | Interpretation | Confidence
~~~

Include at least ten events from at least four evidence categories.

## Phase 7 — Incident Scoping

Answer:

~~~text
Affected identity:
Affected endpoint:
Suspicious source:
Suspicious destination:
Sensitive application activity:
Known files/artifacts:
Known sessions:
Other potentially affected users/hosts:
~~~

Use `unknown` when evidence is insufficient.

## Phase 8 — Incident Classification

Write separate sections:

~~~text
Confirmed facts
Strongly supported interpretations
Possible but unconfirmed explanations
Evidence gaps
~~~

Do not state malware infection or credential theft as fact unless your evidence supports that exact claim.

## Phase 9 — Response Plan

Recommend actions in order:

~~~text
Immediate containment
Identity containment
Endpoint containment
Evidence preservation
Eradication/remediation
Recovery
Monitoring/follow-up
~~~

For each action explain why it is justified by the evidence.

## Deliverable

Submit a concise incident report with:

~~~text
Executive summary
Scope
Evidence reviewed
Unified timeline
Key findings
Confirmed vs. inferred
Impact assessment
Containment actions
Remediation
Additional evidence requested
Confidence / limitations
~~~

## Cleanup

~~~bash
./reset.sh
~~~