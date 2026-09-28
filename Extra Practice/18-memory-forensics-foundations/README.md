# Extra Practice 18 — Memory Forensics Foundations

**Difficulty:** Advanced  
**Estimated time:** 90–120 minutes  
**Environment:** Kali/Linux  
**Infrastructure:** fictional pre-exported Volatility-style evidence

## Scenario

A workstation memory acquisition was processed by an instructor before class. Because real Windows memory images are multi-gigabyte artifacts, this repository contains the relevant **synthetic Volatility-style outputs** instead of a full memory image.

Your job is to correlate processes, command lines, network connections, files, and suspicious memory findings into a defensible hypothesis.

## Evidence

~~~text
case-info.txt
volatility/pslist.txt
volatility/pstree.txt
volatility/cmdline.txt
volatility/netscan.txt
volatility/filescan.txt
volatility/malfind.txt
~~~

## Phase 1 — Process Baseline

Identify normal shell/desktop processes and unusual parent/child relationships.

## Phase 2 — Process Tree

Focus on Office, scripting engines, command shells, and unexpected children.

## Phase 3 — Command Lines

Identify encoded or unusual command-line arguments.

Decode only the harmless Base64 value present in the evidence.

## Phase 4 — Network Correlation

Use PID/process information to correlate suspicious processes with network connections.

Do not conclude malicious C2 solely from an external connection.

## Phase 5 — File Objects

Identify file paths associated with the process sequence, especially temporary-directory artifacts.

## Phase 6 — Suspicious Memory Regions

Review `malfind.txt`.

Explain what executable/writable memory can indicate and why it is not by itself proof of malware.

## Phase 7 — Timeline / Hypothesis

Build a timeline connecting:

~~~text
parent process
child process
command line
network socket
file object
memory finding
~~~

## Phase 8 — Validation Requests

Request at least four additional sources, such as EDR telemetry, PowerShell logs, file hash/content, proxy/DNS logs, user activity, or disk artifacts.

## Deliverable

~~~text
Host:
Primary user:

Suspicious process chain:
Command-line finding:
Network finding:
File finding:
Memory-region finding:

Timeline:
Hypothesis:
Alternative explanation:
Observed:
Inferred:
Unknown:
Additional evidence:
Confidence:
~~~

## Optional Real-Image Extension

If an instructor later provides a separately hosted training memory image, students can reproduce the exports with Volatility 3. The repository itself intentionally avoids committing a multi-gigabyte memory image.