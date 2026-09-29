# Challenge — Build a Scoped TCP Port Scanner

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate |
| Estimated time | 75–105 minutes |
| Environment | Kali + Python 3 + local Docker services |
| Authorized scope | 127.0.0.1 TCP ports 8400–8410 only |
| Goal | Build a reusable Python TCP scanner and compare its results with Nmap |
## Scenario

Complete a Python script that checks a small authorized localhost range and reports which TCP ports accept connections.

The goal is to understand how a basic scanner works rather than replace Nmap.

## Authorized Scope

Only scan:

~~~text
127.0.0.1
TCP ports 8400-8410
~~~

Do not change the target to another host or expand the range for this club challenge.

## Setup

The event lead loads the private flag registry, then prepares ignored runtime artifacts:

~~~bash
chmod +x prepare-flags.sh
./prepare-flags.sh
docker compose up -d
~~~

Python 3 is sufficient.

## Objectives / Tasks

### Files

~~~text
scanner.py
docker-compose.yml
runtime/
services/
~~~

### Requirements

Your script should:

1. accept a host, start port, and end port as command-line arguments,
2. restrict this training version to localhost,
3. validate that the port range is valid,
4. create a TCP socket,
5. apply a short timeout,
6. use `connect_ex()` or equivalent logic to test each port,
7. record and print open ports,
8. print a final summary.

### Phase 1 — Understand the Input

Before coding, identify:

~~~text
Target host:
Start port:
End port:
Expected data type for ports:
Authorized range:
~~~

Explain why accepting user input requires validation.

### Phase 2 — Complete the Scanner

Run:

~~~bash
python3 scanner.py 127.0.0.1 8400 8410
~~~

Do not hard-code the open ports.

The starter script already restricts the training target to localhost. Complete the TODO sections so it iterates through the requested range and reports successful TCP connections.

### Phase 3 — Error Handling

Your script should handle or reject:

- non-integer port arguments,
- a start port greater than the end port,
- ports outside the valid TCP range,
- targets other than localhost,
- connection failures,
- timeouts.

Explain why a closed or filtered port should not crash the entire scan.

### Phase 4 — Output

Default output should show:

~~~text
Target
Port range
Open ports as they are discovered
Final list of open ports
Total open-port count
~~~

Once your scanner produces the required results, inspect `runtime/scanner-complete.txt` and record the first dashboard flag.

### Phase 5 — Validate with Nmap

Use Nmap against the exact same authorized scope:

~~~bash
nmap -p 8400-8410 127.0.0.1
~~~

Compare:

~~~text
Python result:
Nmap result:
Ports both identified:
Differences:
What Nmap tells you that your script does not:
~~~

Your Python scanner answers whether a TCP connection can be established. Nmap provides a much richer scanning and service-enumeration framework.

### Stretch Goals

- add elapsed scan time,
- sort the final port list,
- add a configurable timeout,
- attempt a simple banner read from an already-discovered open port,
- print results as JSON,
- separate scanning logic from output formatting with reusable functions.

### Other Useful Cybersecurity Python Projects

#### Blue Team

- parse local logs and summarize failed authentication activity,
- hash a directory and alert when files change,
- match local indicators against an approved IOC list,
- transform security-tool output into a consistent incident report.

#### Red Team / Authorized Assessment

- grab banners from already-discovered authorized services,
- validate a provided list of HTTP routes and status codes,
- automate repetitive evidence collection during an authorized assessment,
- parse Nmap XML and prioritize discovered services for manual review.

After documenting one example where Python automation improves a cybersecurity workflow and one limitation or risk of custom automation, inspect `runtime/automation-note.txt` and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard, plus:

- completed `scanner.py`,
- sample scanner output,
- Nmap validation output,
- explanation of `connect_ex()`,
- one difference between the Python scanner and Nmap,
- one limitation of the scanner,
- one useful blue-team Python script idea,
- one useful red-team/authorized-assessment Python script idea.

Do not scan outside the localhost range defined by this challenge.

## Cleanup

~~~bash
docker compose down
rm -rf runtime
~~~
