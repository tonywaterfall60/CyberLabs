# Beginner 11 — Intermediate Advancement Capstone Prep

**Difficulty:** Beginner capstone preparation  
**Estimated review time:** 45–60 minutes  
**Prerequisites:** Beginner 01–10

## Purpose

This event prepares members for the Beginner → Intermediate mock interview.

The actual interview is administered using the private instructor rubric. The goal is to verify foundational understanding, reasoning, communication, and safe security practices.

## What You Should Be Able to Explain

### Security Foundations

- confidentiality, integrity, availability
- threat vs. vulnerability vs. risk
- authentication vs. authorization
- attack surface
- why authorization is required before testing

### Linux

You should understand what these do:

```bash
pwd
ls
cd
cat
grep
find
ps
ip addr
ip route
ss
```

You should also understand:

- pipes
- output redirection
- basic permissions

### Networking

Be prepared to explain:

- IP address
- MAC address
- subnet
- default gateway
- DNS
- TCP vs. UDP
- ports
- SSH
- HTTP/HTTPS

### Wireshark

Be prepared to:

- explain packet capture
- use simple display filters
- identify source/destination
- identify DNS
- recognize SYN → SYN-ACK → ACK

### Nmap

Be prepared to explain:

- what a port scan does
- open vs. closed ports
- basic service detection
- why scan scope matters

### Web Security

Be prepared to explain:

- HTTP request/response
- GET vs. POST conceptually
- common status codes
- authentication vs. authorization
- input validation
- why `robots.txt` is not access control

### Cryptography

Be prepared to distinguish:

- encoding
- hashing
- encryption
- symmetric encryption
- asymmetric cryptography

### Digital Forensics

Be prepared to explain:

- evidence preservation
- file hashes
- metadata
- file types vs. extensions
- why analysts document their actions

## Practice Questions

1. What is the difference between authentication and authorization?
2. What does DNS do?
3. What is the purpose of a default gateway?
4. What is the difference between TCP and UDP?
5. What does an open port tell you?
6. Why would an analyst use Wireshark?
7. What does the TCP three-way handshake accomplish?
8. Why is Base64 not encryption?
9. Why calculate a file hash?
10. What should you confirm before scanning a system?

## Practice Practical

Using only your local lab environment, practice:

1. searching a log with `grep`
2. counting matching entries
3. identifying your IP address
4. identifying a TCP connection in Wireshark
5. scanning an authorized local port with Nmap
6. inspecting a local web response with `curl -i`
7. hashing two files and comparing them

## Interview Mindset

You do not need to memorize every command flag.

A strong answer explains:

```text
What I would check
Why I would check it
What result I expect
What the result would mean
How I stay within scope
```

## After Passing

Continue with:

```text
intermediate/01-network-enumeration
```
