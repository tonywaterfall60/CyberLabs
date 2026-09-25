# Beginner 11 — Intermediate Advancement Capstone Prep

**Difficulty:** Beginner capstone preparation  
**Estimated review time:** 60–90 minutes  
**Prerequisites:** Beginner 01–10

## Purpose

This event prepares members for the Beginner → Intermediate mock interview.

The goal is not memorization. The goal is to show that you can:

~~~text
recognize the question
→ choose a reasonable tool
→ explain why
→ interpret the result
→ stay within scope
~~~

The actual advancement interview uses the private instructor rubric.

---

# Part 1 — Core Knowledge Self-Check

Rate yourself for each topic:

~~~text
3 = I can explain it and give an example
2 = I mostly understand it but may need prompting
1 = I recognize it but cannot explain it clearly
0 = I do not understand it yet
~~~

## Security Foundations

- CIA triad
- threat vs. vulnerability vs. risk
- authentication vs. authorization
- attack surface
- mitigation
- scope and authorization

## Linux

- filesystem navigation
- file inspection
- grep/find
- permissions
- processes
- interfaces/routes
- pipes and redirection

## Networking

- IP address
- MAC address
- subnet
- default gateway
- DNS
- TCP vs. UDP
- ports
- SSH
- HTTP/HTTPS

## Packet Analysis

- what a PCAP is
- source/destination
- ports
- DNS
- TCP handshake
- simple Wireshark filters
- simple tshark use

## Nmap

- open vs. closed ports
- service detection
- scan scope
- manual validation with curl/Netcat

## Web

- HTTP request/response
- GET vs. POST conceptually
- status codes
- headers
- cookies
- authentication vs. authorization
- why robots.txt is not access control

## Cryptography

- encoding
- hashing
- encryption
- symmetric encryption
- asymmetric cryptography
- file integrity hashes

## Digital Forensics

- evidence preservation
- hashes
- file type vs. extension
- filesystem metadata
- embedded metadata
- strings
- working from copies

---

# Part 2 — Practice Questions

Answer each out loud in 30–60 seconds.

1. What is the difference between authentication and authorization?
2. What does DNS do?
3. What is the purpose of a default gateway?
4. What is the difference between TCP and UDP?
5. What does an open port tell you?
6. What does an open port **not** prove?
7. Why would an analyst use Wireshark?
8. What does SYN → SYN-ACK → ACK represent?
9. Why is Base64 not encryption?
10. Why calculate a file hash?
11. Why can a filename extension be misleading?
12. What should you confirm before scanning a system?
13. Why manually validate Nmap results?
14. Why is robots.txt not an authorization control?
15. What is the difference between an observation and an interpretation?

---

# Part 3 — Scenario Prompts

## Scenario A — Web Access

A logged-in user changes `/reports/41` to `/reports/42` and sees another user's report.

Explain:

~~~text
Authentication status:
Authorization status:
Security issue:
Impact:
Server-side fix:
~~~

## Scenario B — Network Troubleshooting

A user can open `http://192.168.1.20` but `http://portal.local` fails.

Explain:

~~~text
Most likely component:
First command:
What result would support your hypothesis:
~~~

## Scenario C — File Integrity

Two files have the same name but different SHA-256 hashes.

Explain what that does and does not tell you.

## Scenario D — Nmap

Nmap reports TCP 8080 open and suggests HTTP.

Explain what you would do next and why.

## Scenario E — Packet Capture

You see a packet to TCP 443.

Explain why that alone does not prove which web page a user visited.

---

# Part 4 — Practical Drill

Use only your local CyberLabs environment.

## Linux / CLI

Practice:

~~~bash
pwd
ls -la
grep
find
sort
uniq -c
ip addr
ip route
ss -tulpn
~~~

Be able to explain each command before running it.

## Nmap / HTTP

Start one authorized local Docker lab and practice:

~~~bash
nmap -p <authorized-port> 127.0.0.1
curl -i http://127.0.0.1:<port>/
~~~

Explain which observation came from Nmap and which came from curl.

## Wireshark

Capture one local HTTP request and identify:

~~~text
source
destination
port
request path
response status
one TCP flag
~~~

## Crypto / Forensics

Create two identical files, hash them, modify one, and hash again.

Explain:

~~~text
what changed
what the hash proves
what the hash does not prove
~~~

---

# Part 5 — Explain Your Tool Choice

For each task below, name the first tool you would use and explain why.

| Task | First tool | Why? |
|---|---|---|
| Find text in many files | | |
| Identify local IP address | | |
| Resolve a hostname | | |
| See local listening ports | | |
| Discover authorized open ports | | |
| Inspect HTTP headers | | |
| Inspect packets | | |
| Calculate file integrity digest | | |
| Identify actual file type | | |

---

# Part 6 — Beginner Readiness Standard

You are ready for Intermediate when you can usually do the following without being handed the exact command:

- identify what question you are trying to answer,
- choose a reasonable beginner tool,
- stay within stated scope,
- describe the important output,
- distinguish direct evidence from interpretation,
- manually validate an automated result,
- explain a basic remediation or next step,
- admit when evidence is insufficient.

Intermediate does **not** require memorizing every command flag.

It requires more independent tool selection and stronger evidence-based reasoning.

---

# Part 7 — Self-Assessment

Complete before the mock interview:

~~~text
My strongest Beginner topic:
My weakest Beginner topic:

One command I understand well:
One command I need more practice with:

One networking concept I can explain clearly:
One networking concept I need to review:

One example of authentication vs. authorization:

One example of observation vs. interpretation:

One way I manually validated a tool result:

How I make sure a security activity is in scope:
~~~

## If You Need More Practice

Use the repository's:

~~~text
Extra Practice/
~~~

Good Beginner/Intermediate bridge labs include:

- Linux Incident Investigation
- Network Service Triage
- Web Application Mapping
- Packet Investigation
- Authentication Incident

---

# Interview Mindset

A strong answer sounds like:

~~~text
First I would confirm the scope.
Then I would check __ because __.
I would use __ to answer that question.
If I saw __, I would interpret it as __.
I would validate it by __.
If the evidence were incomplete, I would ask for __.
~~~

That reasoning is more important than reciting a memorized command.

## After Passing

Continue with:

~~~text
intermediate/01-network-enumeration
~~~