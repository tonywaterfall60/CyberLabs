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
Define question
  ↓
Filter
  ↓
Identify conversations
  ↓
Follow streams
  ↓
Correlate timestamps
  ↓
Build timeline
  ↓
Document conclusions
```

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
Source:
Destination:
Protocol:
Action:
Evidence:
Confidence:
```

## Cleanup

```bash
docker compose down
```

## Next Event

[Intermediate 08 — Log Analysis](../08-log-analysis/)
