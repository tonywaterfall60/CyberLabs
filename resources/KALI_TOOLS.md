# Kali Tools Used in CyberLabs

CyberLabs assumes members will often work from a Kali Linux VM.

This guide explains where common Kali tools appear in the curriculum and what members should learn from them.

## Web

### Burp Suite

Used for:

- intercepting HTTP requests
- examining request/response headers
- modifying harmless local requests
- sending requests to Repeater
- understanding cookies and parameters

Primary events:

- Intermediate 02 — Web Enumeration
- Intermediate 03 — OWASP Top 10
- future Advanced web labs

### Gobuster

Used for:

- content discovery against local challenge applications
- learning how wordlists affect discovery

Example:

```bash
gobuster dir -u http://127.0.0.1:8200 -w wordlist.txt
```

### ffuf

Used as an alternative content-discovery tool.

```bash
ffuf -u http://127.0.0.1:8200/FUZZ -w wordlist.txt
```

### Nikto

Used for basic web-server observations and discussion of automated scanner limitations.

Only use it against the local challenge target specified by the event.

---

## Network Enumeration

### Nmap

Used for:

- port discovery
- service detection
- scoped enumeration

### Netcat

Useful for:

- manually validating TCP services
- understanding raw connections

Example against a local lab service:

```bash
nc -nv 127.0.0.1 8110
```

### curl

Used extensively for manual HTTP validation.

---

## Packet Analysis

### Wireshark

GUI packet analysis.

### tcpdump

Command-line capture.

Example:

```bash
sudo tcpdump -i lo tcp port 8300 -w session.pcap
```

### tshark

Command-line Wireshark analysis.

Example:

```bash
tshark -r session.pcap -Y http.request
```

---

## Password Security

### hashid

Used to discuss identifying likely hash formats.

### hashcat

Used only against challenge-provided toy hashes.

### John the Ripper

Can be used as an alternate password-auditing tool on provided training data.

Do not use club exercises against real password databases or credentials.

---

## Reverse Engineering

### file

Identify file type and architecture.

### strings

Extract printable strings.

### readelf / objdump

Inspect ELF metadata, sections, symbols, and disassembly.

### checksec

Review common binary protections.

### GDB

Observe program execution.

### radare2 / rabin2

Alternative static/dynamic binary inspection tools.

### Ghidra

Optional GUI decompiler for later reverse-engineering work.

---

## General Rule

Tools are not the objective by themselves.

For every tool, members should be able to explain:

1. what question they are trying to answer,
2. why the tool is appropriate,
3. what the output means,
4. what the output does **not** prove,
5. whether the target is within authorized scope.
