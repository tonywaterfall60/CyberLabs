# Intermediate 12 — Intermediate CTF

**Difficulty:** Intermediate capstone  
**Estimated time:** 3–4 hours  
**Prerequisites:** Intermediate 01–11

## Purpose

This capstone combines independent enumeration, web mapping, authorization analysis, password/crypto concepts, Linux privilege-audit reasoning, packet/log analysis, Python, forensics, and reverse engineering.

Flags confirm challenge completion. Your **evidence and reasoning** are what demonstrate readiness.

## Setup

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
docker compose up -d
~~~

Authorized scope:

~~~text
127.0.0.1 ports 8400-8499
~/cyberclub/intermediate-ctf/*
~~~

Web target:

~~~text
http://127.0.0.1:8440
~~~

## Challenge 1 — Network Enumeration

Discover the authorized web service, fingerprint it, and manually validate the application.

Submit discovery command, targeted fingerprinting command, and manual validation evidence.

## Challenge 2 — Web Enumeration / Authorization

Map:

~~~text
/
/about
/api/status
/robots.txt
/internal/build
/dashboard
/api/report/<id>
~~~

Login as Alice, establish the normal report request, then make **one controlled object-ID change** to test authorization.

Document baseline, modified request, observed response, impact, and server-side remediation.

## Challenge 3 — Log Correlation

Analyze:

~~~text
~/cyberclub/intermediate-ctf/logs/auth.log
~/cyberclub/intermediate-ctf/logs/vpn.log
~~~

Identify failed attempts, successful session, VPN assignment, and sensitive activity. Build a short timeline.

## Challenge 4 — Linux Privilege Audit

Review:

~~~text
linux-audit/sudoers.txt
linux-audit/cron.txt
linux-audit/permissions.txt
~~~

Identify the strongest privilege-boundary concern and explain the higher-privileged execution plus lower-user influence relationship.

Do not attempt live privilege escalation.

## Challenge 5 — Packet Analysis

Capture only your own requests to port 8440.

Generate a normal login/dashboard/API sequence and identify request paths, response statuses, cookie traffic, and one TCP flag.

Save and hash your PCAP.

## Challenge 6 — Crypto / Integrity

Decode `crypto/message.b64`, verify `known.sha256`, and explain encoding vs hashing vs encryption.

## Challenge 7 — Digital Forensics

Inspect `forensics/mystery.png` with `file`, `strings`, and hashing tools. Compare `original.txt` and `copy.txt`, then modify only the copy and re-hash.

## Challenge 8 — Python Automation

Write a short local parser that counts failed logins in the CTF auth log by user and source. Do not hard-code the answers.

## Challenge 9 — Reverse Engineering

Analyze:

~~~text
~/cyberclub/intermediate-ctf/reversing/intermediate-validator
~~~

Use static and dynamic analysis to recover the accepted phrase. The success path reads `REV_FLAG_VALUE` from the environment.

Use at least four tools from:

~~~text
file
strings
readelf
objdump
checksec
GDB
rabin2
radare2
~~~

## Submission Format

For each challenge:

~~~text
Question:
Method:
Tool/command:
Evidence:
Answer:
Interpretation:
Uncertainty:
Remediation/next step:
~~~

## Readiness Reflection

~~~text
Which challenge required the most independent tool selection?
Which automated result did you manually validate?
Which conclusion remained uncertain?
Where did you stop because scope did not authorize more testing?
Which skill needs review before Advanced?
~~~

## Completion

Afterward, review:

[Intermediate 13 — Advanced Capstone Prep](../13-advanced-capstone-prep/)

## Cleanup

~~~bash
docker compose down
./reset.sh
rm -f intermediate-ctf.pcap
~~~