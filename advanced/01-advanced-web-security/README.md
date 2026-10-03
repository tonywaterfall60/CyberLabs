# Advanced 01 — Advanced Web Security

## Event Snapshot

| Item | Details |
|---|---|
| Track | Advanced |
| Difficulty | Advanced |
| Estimated time | 90–120 minutes |
| Environment | Kali Linux / local CyberLabs environment |
| Prerequisites | Intermediate track readiness |


**Difficulty:** Advanced  
**Estimated time:** 120 minutes  
**Prerequisites:** Intermediate Web Enumeration + OWASP workshop  
**Environment:** Kali Linux, Burp Suite, Docker

## Learning Objectives

Students should be able to:

- build an application threat model
- identify trust boundaries
- test authorization assumptions
- use Burp Proxy and Repeater methodically
- distinguish authentication from object-level authorization
- validate a finding with multiple requests/accounts
- write remediation and detection guidance

## Workflow

```text
Threat model
  ↓
Map roles/resources
  ↓
Establish normal behavior
  ↓
Modify one variable
  ↓
Compare authorization decisions
  ↓
Correlate server telemetry
  ↓
Validate impact
  ↓
Design remediation
  ↓
Design detection
```

Advanced work should connect the offensive observation to the server-side decision and the defensive visibility.

## Challenge

```bash
cd challenge
./prepare-flags.sh
docker compose up --build -d
cat README.md
```

Target:

```text
http://127.0.0.1:8500
```

The application contains an intentionally weak object-authorization check.

The challenge now also writes structured authorization telemetry to:

```text
challenge/runtime/access.jsonl
```

Students correlate the Burp/API request with the application log by request ID.

The event lead prepares private runtime values before launch. Successful cross-user validation reveals the first flag, while correlating the request with structured authorization telemetry leads to the second milestone flag. The dashboard performs verification.

## Tools

- Burp Suite Proxy
- Repeater
- curl
- optional ffuf for route mapping

## Deliverable

Write a professional finding:

```text
Title:
Affected route:
Preconditions:
Expected authorization:
Observed behavior:
Reproduction:
Impact:
Evidence:
Remediation:
Detection/logging:
Confidence:
```

## Cleanup

```bash
docker compose down
```

## Next Event

[Advanced 02 — Binary Analysis Foundations](../02-binary-analysis-foundations/)


---

## Event Navigation
- Previous: [Intermediate Track](../../intermediate/README.md)
- Track Home: [Advanced Track](../README.md)
- Curriculum Index: [All CyberLabs Events](../../CURRICULUM_INDEX.md)
- Next: [Binary Analysis Foundations](../02-binary-analysis-foundations/)
