# Beginner 06 — Intro to Nmap

**Difficulty:** Beginner  
**Estimated time:** 75–90 minutes  
**Prerequisites:** Beginner 03–05  
**Environment:** Nmap + local challenge services

## Why This Event Exists

Nmap helps security professionals understand which network services are exposed by an authorized system. This event teaches basic enumeration while reinforcing ports, protocols, and responsible scope.

## Learning Objectives

Members should be able to:

- explain what a port scan does
- distinguish host discovery from port discovery
- identify open and closed ports
- perform basic service detection
- scan a limited, authorized port range
- document findings
- explain why scan scope matters

## Safety / Scope

Use Nmap only against the local challenge target and explicitly provided lab targets.

Do not scan campus infrastructure, public Internet systems, or other members' devices.

## Core Commands

Basic target scan:

```bash
nmap <target>
```

Service detection:

```bash
nmap -sV <target>
```

Specific ports:

```bash
nmap -p 22,80,443 <target>
```

Port range:

```bash
nmap -p 8000-8100 <target>
```

## Reading Results

Example:

```text
PORT     STATE SERVICE
8080/tcp open  http-proxy
8088/tcp open  radan-http
```

Important distinctions:

**Reachable host** — the host can be contacted.

**Open port** — something is accepting connections on that port.

**Service identification** — Nmap attempts to determine what application/protocol is listening.

## Guided Lab

Use the local challenge to avoid touching external systems.

```bash
cd challenge
docker compose up -d
```

Then scan only:

```text
127.0.0.1 ports 8000–8100
```

Try:

```bash
nmap -p 8000-8100 127.0.0.1
nmap -sV -p 8000-8100 127.0.0.1
```

## Documentation Exercise

Create:

| Port | State | Service guess | Evidence | Security question |
|---:|---|---|---|---|

For each open port, ask:

- Should this service be exposed?
- Is encryption expected?
- Does it require authentication?
- Is the software maintained?

## Challenge

See:

```text
challenge/README.md
```

The goal is to discover the intentionally exposed local services and produce a short enumeration report.

## Cleanup

```bash
docker compose down
```

## Next Event

[Beginner 07 — Web Security Basics](../07-web-security-basics/)
