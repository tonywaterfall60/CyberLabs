# Intermediate 07 — Packet Analysis Challenge

**Difficulty:** Intermediate  
**Estimated time:** 90 minutes  
**Prerequisites:** Beginner Wireshark + Intermediate 01–02  
**Environment:** Wireshark, Docker, curl

## Why This Event Exists

Intermediate packet analysis moves beyond identifying protocols. Members should be able to reconstruct a short sequence of activity, connect packets to application behavior, and explain what a defender could conclude from network evidence.

## Learning Objectives

Members should be able to:

- filter traffic by host, port, and protocol
- follow a TCP stream
- correlate DNS/HTTP activity
- identify request paths and status codes
- build a short network timeline
- distinguish observation from inference

## Workflow

```text
Define investigation question
        ↓
Summarize conversations
        ↓
Filter by host/port/protocol
        ↓
Follow multiple streams
        ↓
Extract fields with tshark
        ↓
Correlate request/response timing
        ↓
Build timeline
        ↓
Separate observed / inferred / unknown
```

Intermediate packet analysis is not just "find the GET request."

The goal is to reconstruct activity and explain the limits of network-only evidence.

## Guided Lab

Start:

```bash
cd challenge
docker compose up -d
./generate-traffic.sh
```

Capture only your own local traffic.

Suggested filters:

```text
tcp.port == 8300
http
tcp.stream eq 0
```

## Challenge

See `challenge/README.md`.

## Deliverable

Produce a timeline with:

```text
Time:
Stream:
Source:
Destination:
Protocol:
Method/path:
Status:
Evidence:
Interpretation:
Confidence:
```

Also include:

```text
Observed:
Inferred:
Unknown:
What another log source could confirm:
```

The challenge now includes a repeated profile request and a reusable training header so students can practice correlation rather than only route identification.

## Cleanup

```bash
docker compose down
```

## Next Event

[Intermediate 08 — Log Analysis](../08-log-analysis/)
