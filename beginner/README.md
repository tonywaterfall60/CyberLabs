# Beginner Track

The Beginner track is a guided progression from general cybersecurity concepts to practical technical skills.

## Recommended Order

| # | Event | Main Skill | Challenge |
|---:|---|---|---|
| 01 | [Intro to Cybersecurity](01-intro-to-cybersecurity/) | Security foundations | Scenario triage |
| 02 | [Linux Basics](02-linux-basics/) | Linux navigation | Log hunt |
| 03 | [Networking Fundamentals](03-networking-fundamentals/) | IP/DNS/TCP/ports | Network troubleshooting |
| 04 | [Command Line Workshop](04-command-line-workshop/) | Pipes/redirection | Log pipeline |
| 05 | [Intro to Wireshark](05-intro-to-wireshark/) | Packet analysis | PCAP investigation |
| 06 | [Intro to Nmap](06-intro-to-nmap/) | Port/service discovery | Local target enumeration |
| 07 | [Web Security Basics](07-web-security-basics/) | HTTP/access control | Local web investigation |
| 08 | [Intro to Cryptography](08-intro-to-cryptography/) | Encoding/hash/encryption | Crypto puzzle |
| 09 | [Intro to Digital Forensics](09-intro-to-digital-forensics/) | Evidence/hash/metadata | File investigation |
| 10 | [Beginner CTF](10-beginner-ctf/) | Skill integration | Multi-category CTF |
| 11 | [Capstone Interview Prep](11-capstone-interview-prep/) | Advancement readiness | Mock interview prep |

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

Challenges are designed to live directly inside the event folder under `challenge/`, so no emailed files or USB transfers should be required.

## Expected Beginner Outcomes

By the end of this track, a member should be able to:

- explain confidentiality, integrity, availability, threats, vulnerabilities, and risk
- work comfortably with basic Linux commands
- explain IP addresses, DNS, TCP/UDP, and ports
- inspect basic packets in Wireshark
- interpret basic Nmap results against an authorized target
- explain HTTP requests/responses and authentication vs. authorization
- distinguish encoding, hashing, and encryption
- calculate and interpret hashes and basic file metadata
- document findings clearly
- understand legal/ethical scope before security testing

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
