# Beginner Challenge Index

This page lists the hands-on challenge location and startup method for each Beginner event.

For the full Beginner curriculum, see:

[README.md](README.md)

---

## Standard Workflow

Clone once:

~~~bash
git clone https://github.com/tonywaterfall60/CyberLabs.git
cd CyberLabs
~~~

Before each event:

~~~bash
git pull
~~~

Enter the event, read its instructions, and only then start the challenge.

---

## Challenges

| # | Event | Challenge Path | Main Tools / Evidence | Startup |
|---:|---|---|---|---|
| 01 | Intro to Cybersecurity | `beginner/01-intro-to-cybersecurity/challenge` | case file, written analysis | none |
| 02 | Linux Basics | `beginner/02-linux-basics/challenge` | bash, grep, find | `./setup.sh` |
| 03 | Networking Fundamentals | `beginner/03-networking-fundamentals/challenge` | dig, ss, curl | none |
| 04 | Command Line Workshop | `beginner/04-command-line-workshop/challenge` | grep, cut, sort, wc | `./setup.sh` |
| 05 | Intro to Wireshark | `beginner/05-intro-to-wireshark/challenge` | Wireshark, tshark | `docker compose up -d` |
| 06 | Intro to Nmap | `beginner/06-intro-to-nmap/challenge` | Nmap, Netcat, curl | `docker compose up -d` |
| 07 | Web Security Basics | `beginner/07-web-security-basics/challenge` | curl, browser, Burp preview | `docker compose up --build -d` |
| 08 | Intro to Cryptography | `beginner/08-intro-to-cryptography/challenge` | base64, sha256sum, hashid | `./setup.sh` |
| 09 | Intro to Digital Forensics | `beginner/09-intro-to-digital-forensics/challenge` | file, strings, stat, exiftool | `./setup.sh` |
| 10 | Beginner CTF | `beginner/10-beginner-ctf` | multiple tools | `./setup.sh && docker compose up -d` |
| 11 | Capstone Interview Prep | `beginner/11-capstone-interview-prep` | readiness workbook | none |
| 12 | Lab Safety & Scoping | `beginner/12-lab-safety-and-scoping/challenge` | scope cards | none |
| 13 | Windows Fundamentals | `beginner/13-windows-fundamentals/challenge` | Windows evidence | none |
| 14 | Identity & Access Basics | `beginner/14-identity-access-basics/challenge` | identity/session logs | none |
| 15 | Intro to Wireless Security | `beginner/15-intro-wireless-security/challenge` | synthetic wireless observations | none |
| 16 | Intro to Security Monitoring | `beginner/16-intro-security-monitoring/challenge` | alert/event log | none |
| 17 | Basic Incident Response | `beginner/17-basic-incident-response/challenge` | incident case evidence | none |

---

## Cleanup

Use the cleanup instructions in the event README.

Typical Docker cleanup:

~~~bash
docker compose down
~~~

Typical script-based cleanup:

~~~bash
./reset.sh
~~~

if the challenge provides a reset script.

---

## Scope

Every Beginner target is local, synthetic, fictional, or intentionally provided.

Do not redirect challenge commands toward university systems, public systems, unrelated devices, or real accounts.

---

## Navigation

- [Beginner Track](README.md)
- [Curriculum Index](../CURRICULUM_INDEX.md)
- [Resources](../resources/README.md)
- [Extra Practice](../Extra%20Practice/README.md)
