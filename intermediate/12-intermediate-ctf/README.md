# Intermediate 12 — Intermediate CTF

**Difficulty:** Intermediate capstone  
**Estimated time:** 2–3 hours  
**Prerequisites:** Intermediate 01–11

## Purpose

This CTF combines enumeration, web mapping, password concepts, privilege-audit reasoning, packet/log analysis, Python, and reverse engineering.

## Setup

```bash
./setup.sh
docker compose up -d
```

Authorized scope:

```text
127.0.0.1 ports 8400-8499
~/cyberclub/intermediate-ctf/*
```

## Categories

1. Network Enumeration
2. Web Enumeration
3. Password Security
4. Linux Privilege Audit
5. Packet / HTTP Analysis
6. Log Analysis
7. Python Automation
8. Reverse Engineering

Any challenge flag uses:

```text
SRU{}
```

## Completion

Afterward, review:

[Intermediate 13 — Advanced Capstone Prep](../13-advanced-capstone-prep/)

## Cleanup

```bash
docker compose down
./reset.sh
```
