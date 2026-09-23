# Intermediate 01 — Network Enumeration

**Difficulty:** Intermediate  
**Estimated time:** 90 minutes  
**Prerequisites:** Beginner track completion  
**Environment:** Nmap, curl, Docker

## Why This Event Exists

Beginner Nmap taught members how to identify ports. Intermediate enumeration adds structure: discover, validate, fingerprint, document, prioritize, and recommend defensive action.

## Learning Objectives

Members should be able to:

- define an authorized enumeration scope
- identify exposed services
- perform targeted service detection
- manually validate service behavior
- distinguish observation from assumption
- prioritize findings
- write a concise enumeration report

## Enumeration Workflow

```text
Confirm scope
   ↓
Identify exposed ports
   ↓
Fingerprint services
   ↓
Manually validate
   ↓
Record evidence
   ↓
Prioritize
   ↓
Recommend hardening
```

## Guided Lab

Start the local environment:

```bash
cd challenge
docker compose up -d
```

Authorized scope:

```text
127.0.0.1
Ports 8100-8199
```

### Discovery

```bash
nmap -p 8100-8199 127.0.0.1
```

### Service Detection

Run `-sV` only against discovered ports.

### Manual Validation

Use tools appropriate to the service, such as:

```bash
curl -i http://127.0.0.1:<port>/
```

## Analysis Questions

For each service:

1. What evidence identifies the service?
2. Does it expose a banner/version?
3. Does it require authentication?
4. Is the traffic encrypted?
5. Should it be exposed?
6. What defensive improvement would you recommend?

## Challenge

See `challenge/README.md`.

## Deliverable

```text
Target:
Authorized scope:
Open ports:
Service evidence:
Interesting observations:
Risk questions:
Recommended hardening:
```

## Cleanup

```bash
docker compose down
```

## Next Event

[Intermediate 02 — Web Enumeration](../02-web-enumeration/)
