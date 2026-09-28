# Extra Practice 17 — Email / Phishing Forensics

## Lab Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate → Advanced |
| Estimated time | 90–120 minutes |
| Environment | Kali / Linux |
| Infrastructure | Fictional .eml evidence package |
| Tools | sha256sum, text tools, mail-header analysis |
## Scenario

A user reports a suspicious message after receiving several emails during the same afternoon. You are given three fictional raw email files and a small analyst notes file.

Your job is to identify which message deserves escalation, reconstruct the delivery path, analyze authentication results, extract indicators, and explain what the evidence does and does not prove.

## Authorized Scope

Use only the files in this directory. Do not browse to or interact with any domains, IPs, URLs, or addresses found in the evidence.

## Setup

No external mail service or browsing is required.

## Investigation / Tasks

### Evidence

~~~text
messages/01-invoice.eml
messages/02-newsletter.eml
messages/03-password-reset.eml
analyst-notes.txt
~~~

### Phase 1 — Preserve and Inventory

Hash all `.eml` files and record sizes.

### Phase 2 — Header Analysis

For each message identify:

~~~text
From
Reply-To
Return-Path
Message-ID domain
Received chain
SPF
DKIM
DMARC
Subject
Date
~~~

Distinguish display-name identity from envelope/authentication evidence.

### Phase 3 — Body / URL Analysis

Extract all URLs without visiting them.

Record:

~~~text
displayed text
actual hostname
path
scheme
whether hostname matches the claimed organization
~~~

### Phase 4 — Attachment / Content Clues

Identify whether any message references an attachment or encourages credential entry.

Do not execute or download anything external.

### Phase 5 — Delivery Timeline

Use `Date` and `Received` headers to build a timeline of message handling.

Discuss why sender-controlled timestamps may be less trustworthy than receiving-system timestamps.

### Phase 6 — Verdicts

Classify each message as:

~~~text
likely benign
suspicious
high-confidence phishing
insufficient evidence
~~~

Support every verdict with header/body evidence.

### Phase 7 — Detection Ideas

Write detection ideas for at least three of:

- display-name/domain mismatch,
- failed DMARC,
- mismatched Reply-To,
- suspicious URL hostname,
- credential-reset language from an unexpected sender,
- newly observed sender infrastructure.

## Deliverable

~~~text
Message hashes:

Message 01 verdict:
Evidence:

Message 02 verdict:
Evidence:

Message 03 verdict:
Evidence:

Delivery timeline:
Indicators:
Observed:
Inferred:
Unknown:
Recommended user/SOC actions:
Detection ideas:
~~~

## Cleanup

No cleanup is required for this static evidence lab.