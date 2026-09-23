# Beginner Track

The Beginner track is a guided progression from general cybersecurity concepts to practical technical skills using a Kali Linux VM.

The goal is **familiarity before mastery**. Beginner events introduce tools in controlled local labs so members understand what each tool does before Intermediate expects them to use the tools independently.

## Recommended Order

| # | Event | Main Skill | Kali Tools Introduced |
|---:|---|---|---|
| 01 | [Intro to Cybersecurity](01-intro-to-cybersecurity/) | Security foundations | — |
| 02 | [Linux Basics](02-linux-basics/) | Linux navigation | bash, grep, find, ip |
| 03 | [Networking Fundamentals](03-networking-fundamentals/) | IP/DNS/TCP/ports | dig, traceroute, ss, curl |
| 04 | [Command Line Workshop](04-command-line-workshop/) | Pipes/redirection | grep, cut, sort, wc |
| 05 | [Intro to Wireshark](05-intro-to-wireshark/) | Packet analysis | Wireshark, tshark, tcpdump preview |
| 06 | [Intro to Nmap](06-intro-to-nmap/) | Port/service discovery | Nmap, Netcat, curl |
| 07 | [Web Security Basics](07-web-security-basics/) | HTTP/access control | curl, browser dev tools, Burp preview |
| 08 | [Intro to Cryptography](08-intro-to-cryptography/) | Encoding/hash/encryption | base64, sha256sum, hashid |
| 09 | [Intro to Digital Forensics](09-intro-to-digital-forensics/) | Evidence/hash/metadata | file, strings, stat, exiftool |
| 10 | [Beginner CTF](10-beginner-ctf/) | Skill integration | multiple tools |
| 11 | [Capstone Interview Prep](11-capstone-interview-prep/) | Advancement readiness | review |

## Tool Progression

Beginner members should understand the **purpose** of these tools:

```text
Networking
  ├── dig
  ├── traceroute
  └── ss

Packet Analysis
  ├── Wireshark
  ├── tshark
  └── tcpdump (preview)

Enumeration
  ├── Nmap
  ├── Netcat
  └── curl

Web
  ├── Firefox Developer Tools
  ├── curl
  └── Burp Suite (preview)

Crypto
  ├── base64
  ├── sha256sum
  └── hashid

Forensics
  ├── file
  ├── strings
  ├── stat
  └── exiftool
```

Intermediate builds on this by adding tools such as:

- Burp Repeater
- Gobuster
- ffuf
- Nikto
- hashcat
- GDB
- radare2
- more advanced tshark/tcpdump usage

## Member Workflow

Clone once:

```bash
git clone https://github.com/tonywaterfall60/CyberLabs.git
cd CyberLabs
```

Before a meeting:

```bash
git pull
```

Then:

```bash
cd beginner/<event-folder>
cat README.md
```

Challenges live under each event's `challenge/` directory whenever possible.

## Expected Beginner Outcomes

By the end of this track, a member should be able to:

- explain confidentiality, integrity, availability, threats, vulnerabilities, and risk
- work comfortably in a Kali/Linux terminal
- explain IP addresses, DNS, routes, TCP/UDP, and ports
- use `dig`, `ss`, and basic connectivity tools
- inspect packets in Wireshark
- reproduce a simple observation with tshark
- interpret basic Nmap results
- manually validate an HTTP service with curl or Netcat
- explain HTTP requests/responses and authentication vs. authorization
- understand the purpose of Burp Suite
- distinguish encoding, hashing, and encryption
- use hashid as a basic hash-identification aid
- calculate and interpret hashes
- inspect files using `file`, `strings`, `stat`, and `exiftool`
- document findings clearly
- understand legal and ethical scope before testing

## Typical Event Format

| Time | Activity |
|---|---|
| 0–10 min | Review and goals |
| 10–30 min | Concepts |
| 30–45 min | Instructor demonstration |
| 45–70 min | Guided lab |
| 70–85 min | Challenge |
| 85–90 min | Review / next steps |

## Advancement

After the Beginner CTF, members may take the Beginner → Intermediate mock interview.

Passing the capstone moves the member to:

```text
intermediate/01-network-enumeration
```

At that point, members are expected to move from **guided tool usage** toward **independent tool selection and analysis**.
