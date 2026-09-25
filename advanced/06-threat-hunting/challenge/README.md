# Challenge — Hypothesis-Driven Script Execution Hunt

**Difficulty:** Advanced  
**Estimated time:** 90–120 minutes

## Dataset

~~~text
events.jsonl
~~~

Everything is synthetic.

## Initial Hypothesis

An Office-launched encoded PowerShell process may be associated with follow-on network, file, process, DNS, or registry activity on the same host.

Treat this as a hypothesis to test—not a conclusion.

## Phase 1 — Define Required Telemetry

Before querying, write which event types and fields would support or refute the hypothesis.

## Phase 2 — Broad Baseline

Determine:

- hosts represented,
- users represented,
- process event counts,
- PowerShell usage across hosts,
- normal examples of PowerShell.

## Phase 3 — Narrow the Hunt

Find encoded PowerShell and correlate events on the same host/user within a short time window.

Decode only the harmless Base64 value present in the dataset.

## Phase 4 — Sequence Reconstruction

Build the full `WS-03` sequence, including DNS, network, file, child-process, and registry events.

## Phase 5 — Compare a Benign-Looking PowerShell Case

Compare `WS-03` with the scheduled inventory-style PowerShell on `WS-04`.

List the behavioral differences that make one case more interesting.

## Phase 6 — Alternative Explanations

Write at least two benign or administrative explanations for the `WS-03` sequence.

State what evidence would support or reject each.

## Phase 7 — Hunt Expansion

Convert the initial host-specific hunt into a broader reusable query idea.

Do not hard-code `WS-03`, `carol`, or one destination IP.

## Phase 8 — Hunt Outcome

Classify the hunt result as:

~~~text
no meaningful lead
lead requiring validation
strongly suspicious sequence
confirmed malicious activity
~~~

Justify your choice from the evidence. Avoid claiming confirmed malware unless the dataset actually proves it.

## Deliverable

~~~text
Hypothesis:
Required telemetry:
Baseline observations:
Queries:

Suspicious sequence:
Comparison case:

Supporting evidence:
Alternative explanations:
Evidence needed to validate:

Reusable hunt logic:
Hunt outcome:
Confidence:
~~~