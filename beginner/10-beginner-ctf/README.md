# Beginner 10 — Beginner CTF

**Difficulty:** Beginner capstone  
**Estimated time:** 2–3 hours  
**Prerequisites:** Beginner 01–09  
**Environment:** Kali/Linux, Docker, Wireshark, Nmap, curl

## Purpose

This CTF combines the entire Beginner track into one authorized local environment.

The objective is not speed or guessing flags.

A strong solution shows:

~~~text
Question
→ tool choice
→ evidence
→ answer
→ explanation
~~~

## Setup

From this directory:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
docker compose up -d
~~~

Generated files:

~~~text
~/cyberclub/beginner-ctf/
├── linux/
├── logs/
├── crypto/
└── forensics/
~~~

Web target:

~~~text
http://127.0.0.1:8090
~~~

## Scope

Authorized targets only:

~~~text
~/cyberclub/beginner-ctf/*
127.0.0.1:8090
~~~

Do not scan or test anything else.

---

# Challenge 1 — Linux Evidence Hunt

Find the private Linux flag somewhere under:

~~~text
~/cyberclub/beginner-ctf/linux
~~~

Record:

~~~text
Command used:
Full path:
File permissions:
Flag:
~~~

# Challenge 2 — Authentication Log Analysis

Analyze:

~~~text
~/cyberclub/beginner-ctf/logs/auth.log
~~~

Determine:

- failed-login count,
- most targeted user,
- most common source,
- successful-login count.

Use pipelines rather than manual counting.

# Challenge 3 — Networking Fundamentals

Explain:

1. DNS,
2. default gateway,
3. TCP vs. UDP,
4. expected services for ports 22 and 443,
5. why a successful ping does not prove HTTP is working.

# Challenge 4 — Nmap Enumeration

Scan only:

~~~text
127.0.0.1 port 8090
~~~

Record:

~~~text
Port state:
Service guess:
Manual validation command:
Application evidence:
~~~

# Challenge 5 — Web Mapping

Map:

~~~text
/
/about
/api/status
/robots.txt
/training-admin
~~~

Record status, content type, and one custom header for each route.

Explain why discovering `/training-admin` through `robots.txt` is not the same thing as bypassing authorization.

# Challenge 6 — Packet Analysis

Start a Wireshark capture of your own local traffic.

Then generate:

~~~bash
curl http://127.0.0.1:8090/
curl http://127.0.0.1:8090/api/status
~~~

Identify:

- destination port,
- request paths,
- one TCP flag,
- HTTP response status.

Save the capture as `beginner-ctf.pcap` and calculate its SHA-256.

# Challenge 7 — Cryptography

Use the files under:

~~~text
~/cyberclub/beginner-ctf/crypto
~~~

Tasks:

1. decode `message.b64`,
2. classify Base64,
3. hash `evidence.txt`,
4. compare it with `known.sha256`,
5. explain the difference between hashing and encryption.

# Challenge 8 — Digital Forensics

Use:

~~~text
~/cyberclub/beginner-ctf/forensics/
~~~

Tasks:

1. identify actual file types,
2. hash `original.txt` and `copy.txt`,
3. modify only `copy.txt`,
4. hash again,
5. inspect `mystery.jpg` with `file` and `strings`,
6. explain what the evidence supports.

# Challenge 9 — Security Reasoning

Scenario:

> A normal authenticated user can request another user's report by changing only a document number in the URL.

Answer:

~~~text
Authentication working? yes/no
Authorization working? yes/no
Primary security issue:
Likely impact:
Server-side mitigation:
~~~

# Final Submission

For every challenge use:

~~~text
Challenge:
Question:
Command/tool:
Important evidence:
Answer:
Reasoning:
~~~

## Beginner Readiness Check

Before finishing, answer:

~~~text
Which tool felt most comfortable?
Which tool needs more practice?
Which result did you manually validate?
Which conclusion required interpretation rather than direct observation?
How did you stay within scope?
~~~

## Completion

After the CTF, continue to:

[Beginner 11 — Capstone Interview Prep](../11-capstone-interview-prep/)

## Cleanup

~~~bash
docker compose down
./reset.sh
rm -f beginner-ctf.pcap
~~~