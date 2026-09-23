# Beginner 06 — Intro to Nmap

**Difficulty:** Beginner  
**Estimated time:** 75–90 minutes  
**Prerequisites:** Beginner 03–05  
**Environment:** Kali Linux, Nmap, Netcat, curl, local challenge services

## Why This Event Exists

Nmap helps security professionals understand which network services are exposed by an authorized system. This event teaches basic enumeration and then shows how to manually validate what Nmap reports.

## Learning Objectives

Members should be able to:

- explain what a port scan does
- identify open and closed ports
- perform basic service detection
- scan a limited authorized port range
- use Netcat to manually connect to a discovered TCP service
- use curl to validate HTTP services
- document findings
- explain why scan scope matters

## Kali Tools Introduced

| Tool | Purpose |
|---|---|
| Nmap | port/service discovery |
| Netcat (`nc`) | raw TCP connection testing |
| curl | HTTP validation |

## Safety / Scope

Use these tools only against the provided local challenge target.

## Core Nmap Commands

```bash
nmap <target>
nmap -sV <target>
nmap -p 22,80,443 <target>
nmap -p 8000-8100 <target>
```

## Guided Lab

Start:

```bash
cd challenge
docker compose up -d
```

Authorized scope:

```text
127.0.0.1 ports 8000-8100
```

### Task 1 — Discover Services

```bash
nmap -p 8000-8100 127.0.0.1
```

### Task 2 — Service Detection

```bash
nmap -sV -p 8000-8100 127.0.0.1
```

### Task 3 — Validate with curl

```bash
curl -i http://127.0.0.1:8080/
```

### Task 4 — Validate with Netcat

```bash
nc -nv 127.0.0.1 8080
```

Then type:

```http
GET / HTTP/1.0

```

Press Enter twice.

Observe the raw HTTP response.

## Discussion

Nmap might identify a port as HTTP, but manual validation gives you additional evidence about what the service actually returns.

## Documentation Exercise

| Port | Nmap result | Manual validation | Evidence |
|---:|---|---|---|

## Challenge

See:

```text
challenge/README.md
```

Use Nmap first, then validate at least one discovered service with `curl` or `nc`.

## Cleanup

```bash
docker compose down
```

## Next Event

[Beginner 07 — Web Security Basics](../07-web-security-basics/)
