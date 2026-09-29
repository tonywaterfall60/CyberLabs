# Intermediate 10 — Python for Cybersecurity

## Event Snapshot

| Item | Details |
|---|---|
| Track | Intermediate |
| Difficulty | Intermediate |
| Estimated time | 75–90 minutes |
| Environment | Kali Linux / local CyberLabs environment |
| Prerequisites | 09 — OSINT Workshop |


**Difficulty:** Intermediate  
**Estimated time:** 90 minutes  
**Prerequisites:** Intermediate 08  
**Environment:** Python 3

## Learning Objectives

Members should be able to:

- use Python sockets for basic TCP connectivity checks
- accept and validate command-line arguments
- loop through an authorized port range
- handle connection errors and timeouts cleanly
- collect and summarize scan results
- compare custom Python output with a standard tool such as Nmap
- write small reusable functions
- explain why authorization and scope matter when automating network activity
- identify useful Python automation ideas for both blue-team and red-team work
- explain when a custom script is preferable to manual analysis or a full security tool

## Guided Example

```python
import socket

host = "127.0.0.1"
port = 8401

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
    sock.settimeout(0.3)
    result = sock.connect_ex((host, port))

if result == 0:
    print(f"{port}/tcp open")
else:
    print(f"{port}/tcp closed")
```

This example answers one narrow question:

```text
Can I establish a TCP connection to this port?
```

A complete scanner should generalize that logic across an authorized range rather than hard-code one port.

## Challenge

Complete the starter scanner in `challenge/scanner.py`.

The challenge provides three localhost-only training services across:

```text
127.0.0.1
TCP 8400–8410
```

Students should build the scanner, identify the open ports, compare the result with Nmap, and explain what a successful TCP connection does and does not prove.

The objective is not simply to make the script run. Students should be able to explain the socket workflow, input validation, timeout behavior, scope restriction, and limitations of the result.

## Useful Python Script Ideas for Cybersecurity

Python is valuable because small scripts can automate repetitive security tasks without replacing purpose-built tools.

### Blue Team Examples

- **File-integrity monitor** — hash important files and report unexpected changes.
- **Log triage script** — parse authentication or web logs and count suspicious sources, users, or event types.
- **IOC matcher** — compare IPs, domains, or hashes from local logs against an approved indicator list.
- **Alert enrichment** — take an alert record and add local asset, owner, or severity context.

### Red Team / Assessment Examples

Use only in authorized environments.

- **TCP port scanner** — identify reachable services in an approved range.
- **Banner grabber** — connect to known authorized ports and record service banners.
- **HTTP endpoint validator** — request a provided route list and record status codes, headers, and content types.
- **Assessment result normalizer** — convert output from tools such as Nmap into a consistent report format.

A useful rule is:

```text
Python automates a clearly defined question.
Authorization still defines where the script may run.
```

## Deliverable

Your script should report:

- target host
- authorized port range
- each open TCP port
- total number of open ports
- scan completion summary

Also provide:

- the equivalent Nmap validation command
- one difference between your Python scanner and Nmap
- one limitation of TCP connect scanning
- one blue-team Python automation idea
- one red-team/assessment Python automation idea

## Next Event

[Intermediate 11 — Intro to Reverse Engineering](../11-intro-to-reverse-engineering/)


---

## Event Navigation
- Previous: [OSINT Workshop](../09-osint-workshop/)
- Track Home: [Intermediate Track](../README.md)
- Curriculum Index: [All CyberLabs Events](../../CURRICULUM_INDEX.md)
- Next: [Intro to Reverse Engineering](../11-intro-to-reverse-engineering/)
