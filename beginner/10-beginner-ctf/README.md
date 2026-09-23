# Beginner 10 — Beginner CTF

**Difficulty:** Beginner capstone  
**Estimated time:** 90–120 minutes  
**Prerequisites:** Beginner 01–09  
**Environment:** Linux/WSL, Docker, Wireshark, Nmap

## Purpose

This CTF combines the entire Beginner track into one authorized local challenge environment.

The objective is not speed. Members should demonstrate that they can choose an appropriate tool, explain what they observe, and stay within scope.

## Setup

From this directory:

```bash
./setup.sh
docker compose up -d
```

The setup creates challenge files in:

```text
~/cyberclub/beginner-ctf
```

The Docker service is available only on:

```text
127.0.0.1:8090
```

## Scope

Authorized targets:

```text
~/cyberclub/beginner-ctf/*
127.0.0.1:8090
```

Do not scan or test anything else for this CTF.

## Challenge 1 — Linux

Find the flag hidden somewhere under:

```text
~/cyberclub/beginner-ctf/linux
```

Use command-line search tools.

## Challenge 2 — Log Analysis

Analyze:

```text
~/cyberclub/beginner-ctf/logs/auth.log
```

Answer:

1. How many failed logins occurred?
2. Which user had the most failures?
3. Which source IP appears most often?

## Challenge 3 — Networking

Explain:

1. What service would you normally expect on port 22?
2. What service would you normally expect on port 443?
3. What is the role of DNS?
4. What does a default gateway do?

## Challenge 4 — Nmap

Scan only:

```text
127.0.0.1 port 8090
```

Identify:

- port state
- detected service
- one piece of evidence supporting your answer

## Challenge 5 — Web

Visit:

```text
http://127.0.0.1:8090
```

Find:

- HTTP status
- response content type
- one custom training header
- the path listed in `robots.txt`

Explain why `robots.txt` is not access control.

## Challenge 6 — Wireshark

Capture your own traffic while visiting the local web challenge.

Identify:

- destination port
- HTTP request path
- one TCP flag
- response status

## Challenge 7 — Cryptography

Decode:

```text
RkxBR3tiYXNlNjRfaXNfZW5jb2Rpbmd9
```

Then explain why the transformation is not encryption.

## Challenge 8 — Forensics

Hash:

```text
~/cyberclub/beginner-ctf/forensics/original.txt
~/cyberclub/beginner-ctf/forensics/copy.txt
```

Then modify only `copy.txt`, hash it again, and explain what the change demonstrates.

## Suggested Submission

```text
Challenge:
Answer:
Commands/tools used:
Reasoning:
```

## Completion

After completing the CTF, members should review:

[Beginner 11 — Capstone Interview Prep](../11-capstone-interview-prep/)

## Cleanup

```bash
docker compose down
./reset.sh
```
