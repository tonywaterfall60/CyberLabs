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

~~~text
Confirm scope
   ↓
Choose a discovery question
   ↓
Identify exposed ports
   ↓
Fingerprint only discovered services
   ↓
Manually validate
   ↓
Classify service role/sensitivity
   ↓
Record evidence and uncertainty
   ↓
Prioritize
   ↓
Recommend hardening
~~~

Intermediate members should be able to explain **why** they chose a scan rather than only reproduce a provided command.

A strong answer distinguishes:

~~~text
Observation:
TCP 8140 is open.

Tool inference:
Nmap suggests HTTP.

Manual validation:
The service exposes observability metrics.

Security interpretation:
Metrics may reveal internal operational information and should be reviewed for exposure.
~~~

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
2. Which evidence came from Nmap and which came from manual validation?
3. Does it expose operational or internal information?
4. Does it appear administrative, monitoring-related, or lower sensitivity?
5. Is authentication represented?
6. Is the traffic encrypted?
7. Should this audience/network be able to reach it?
8. What is still unknown?
9. What defensive improvement would you recommend?

The challenge now contains four distinct service roles, including a machine-readable metrics endpoint.

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
