# Beginner Track

The Beginner track is a guided progression from general cybersecurity concepts into practical technical skills using controlled local labs.

The goal is **familiarity before mastery**. Members learn what common tools do, how to collect evidence, and how to stay within scope before later tracks expect independent tool selection.

---

## Who This Track Is For

Beginner is intended for members who are:

- new to cybersecurity,
- new to Kali/Linux,
- learning networking and web concepts for the first time,
- comfortable learning through guided demonstrations and hands-on labs.

No prior cybersecurity experience is required.

---

## Prerequisites

Recommended:

- a Kali Linux VM,
- basic computer literacy,
- willingness to use a terminal,
- ability to follow lab scope and cleanup instructions.

For setup help, see:

[../resources/README.md](../resources/README.md)

---

## Expected Independence

Beginner members are expected to:

- follow guided workflows,
- ask questions when a concept is unfamiliar,
- explain what a tool is doing before relying on it,
- record important output,
- distinguish observations from guesses,
- follow the exact authorized scope.

Instructor guidance is expected and normal.

---

## Recommended Order

| # | Event | Main Focus | Tools / Environment |
|---:|---|---|---|
| 01 | [Intro to Cybersecurity](01-intro-to-cybersecurity/) | security foundations, CIA, risk | case-based analysis |
| 02 | [Linux Basics](02-linux-basics/) | Linux navigation, files, permissions | bash, grep, find, ip |
| 03 | [Networking Fundamentals](03-networking-fundamentals/) | IP, DNS, TCP/UDP, ports | dig, traceroute, ss, curl |
| 04 | [Command Line Workshop](04-command-line-workshop/) | pipes, redirection, filtering | grep, cut, sort, wc |
| 05 | [Intro to Wireshark](05-intro-to-wireshark/) | packet analysis | Wireshark, tshark |
| 06 | [Intro to Nmap](06-intro-to-nmap/) | scoped port/service discovery | Nmap, Netcat, curl |
| 07 | [Web Security Basics](07-web-security-basics/) | HTTP, sessions, access control | curl, browser tools, Burp preview |
| 08 | [Intro to Cryptography](08-intro-to-cryptography/) | encoding, hashing, encryption | base64, sha256sum, hashid |
| 09 | [Intro to Digital Forensics](09-intro-to-digital-forensics/) | evidence, hashing, metadata | file, strings, stat, exiftool |
| 10 | [Beginner CTF](10-beginner-ctf/) | skill integration | multiple tools |
| 11 | [Capstone Interview Prep](11-capstone-interview-prep/) | Intermediate readiness | review + practical drill |

For a repository-wide view, see:

[../CURRICULUM_INDEX.md](../CURRICULUM_INDEX.md)

---

## Tool Progression

Beginner introduces the purpose of:

~~~text
Networking
  dig
  traceroute
  ss
  curl

Packet Analysis
  Wireshark
  tshark

Enumeration
  Nmap
  Netcat
  curl

Web
  Firefox/Browser Developer Tools
  curl
  Burp Suite preview

Cryptography
  base64
  sha256sum
  hashid

Forensics
  file
  strings
  stat
  exiftool
~~~

Members are not expected to memorize every command. They should understand **what question each tool helps answer**.

---

## Expected Outcomes

By the end of Beginner, a member should be able to:

- explain confidentiality, integrity, availability, threats, vulnerabilities, and risk,
- work comfortably in a Kali/Linux terminal,
- explain IP addresses, DNS, routes, TCP/UDP, and ports,
- use basic network troubleshooting commands,
- inspect packets in Wireshark,
- reproduce a simple packet observation with tshark,
- interpret basic Nmap results,
- manually validate a service with curl or Netcat,
- explain HTTP requests/responses and authentication vs. authorization,
- distinguish encoding, hashing, and encryption,
- calculate and interpret hashes,
- inspect files with common forensic utilities,
- document evidence clearly,
- explain the authorized scope before testing.

---

## Typical Event Format

| Time | Activity |
|---|---|
| 0–10 min | Review and goals |
| 10–30 min | Concepts |
| 30–45 min | Instructor demonstration |
| 45–70 min | Guided lab |
| 70–85 min | Challenge |
| 85–90 min | Review / next steps |

Individual events may vary.

---

## CTF and Advancement

The Beginner CTF is the main skill-integration event.

After the CTF, members can use:

[11 — Capstone Interview Prep](11-capstone-interview-prep/)

to prepare for the Beginner → Intermediate readiness interview.

Members moving into Intermediate should be ready to transition from:

~~~text
guided tool usage
→ structured independent tool selection
~~~

Continue with:

[Intermediate Track](../intermediate/README.md)

---

## Extra Practice

Beginner-friendly and Beginner → Intermediate Extra Practice labs are listed in:

[../Extra%20Practice/README.md](../Extra%20Practice/README.md)

Use Extra Practice for repetition; it does not replace the main track unless an event lead says otherwise.

---

## Navigation

- [CyberLabs Home](../README.md)
- [Curriculum Index](../CURRICULUM_INDEX.md)
- [Resources](../resources/README.md)
- [Extra Practice](../Extra%20Practice/README.md)
- [Roadmap](../ROADMAP.md)
