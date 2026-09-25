# Challenge — Synthetic Network Behavior Investigation

**Difficulty:** Advanced  
**Estimated time:** 90–120 minutes

## Scenario

A network analyst noticed recurring traffic from one workstation but does not know whether it represents benign telemetry, automation, or something requiring escalation.

Everything in the PCAP is synthetic and uses private/documentation address space.

## Generate

~~~bash
python3 generate_pcap.py
sha256sum advanced-network.pcap
~~~

## Phase 1 — Conversation Baseline

Use Wireshark/tshark to identify:

- all IP conversations,
- top talkers,
- destination ports,
- DNS queries,
- obvious internal application traffic.

## Phase 2 — Periodicity

Identify all recurring flows, not just the first one that looks unusual.

For each recurring flow record:

~~~text
Source:
Destination:
Port:
Count:
First timestamp:
Last timestamp:
Approximate interval:
Payload clue:
~~~

## Phase 3 — DNS Correlation

Determine whether a DNS query occurs near the recurring traffic.

Do not claim the DNS name definitively maps to every later packet unless the evidence supports that conclusion.

## Phase 4 — Host-of-Interest Timeline

Build a timeline for `10.30.0.25` containing:

- DNS activity,
- internal application access,
- report/export-related request,
- recurring external/documentation-range flow.

## Phase 5 — Compare Against Benign Periodicity

Compare the 60-second recurring flow with the slower printer-status flow.

Explain why periodicity alone is not enough to classify behavior.

## Phase 6 — tshark Extraction

Produce at least two field-extraction commands showing:

1. recurring connection timing,
2. HTTP-like request paths or DNS query names.

## Phase 7 — Hypotheses

Write at least three hypotheses for the recurring 8443 traffic.

Example categories:

~~~text
benign telemetry
scheduled health check
misconfigured software
unauthorized remote communication
~~~

Do not decide among them without evidence.

## Phase 8 — Validation Plan

Request at least four additional evidence sources.

For each state the exact question it would answer.

## Deliverable

~~~text
PCAP SHA-256:
Top talkers:
Recurring flows:

Host-of-interest timeline:
DNS correlation:

Primary hypothesis:
Alternative hypotheses:
Evidence supporting each:
Evidence against each:

Additional telemetry:
Confidence:
Unknowns:
~~~