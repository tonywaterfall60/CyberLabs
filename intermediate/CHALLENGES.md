# Intermediate Challenge Index

This page lists the hands-on challenge location and startup method for each Intermediate event.

For the full Intermediate curriculum, see:

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

Enter the event, read its README, identify the scope, and then start the challenge.

---

## Challenges

| # | Event | Challenge Path | Main Tools / Evidence | Startup |
|---:|---|---|---|---|
| 01 | Network Enumeration | `intermediate/01-network-enumeration/challenge` | Nmap, curl, Netcat | `docker compose up --build -d` |
| 02 | Web Enumeration | `intermediate/02-web-enumeration/challenge` | Burp, ffuf/Gobuster, curl | `docker compose up --build -d` |
| 03 | OWASP Top 10 Workshop | `intermediate/03-owasp-top-10/challenge` | case evidence, web-risk analysis | none |
| 04 | Password Security | `intermediate/04-password-security/challenge` | hashid, hashcat, Python | none |
| 05 | Linux Privilege Escalation Foundations | `intermediate/05-linux-privilege-escalation/challenge` | static Linux audit evidence | `./setup.sh` |
| 06 | Windows Privilege Escalation Foundations | `intermediate/06-windows-privilege-escalation/challenge` | exported Windows evidence | none |
| 07 | Packet Analysis Challenge | `intermediate/07-packet-analysis/challenge` | Wireshark, tshark | `docker compose up --build -d` |
| 08 | Log Analysis | `intermediate/08-log-analysis/challenge` | grep, jq, Python | `./setup.sh` |
| 09 | OSINT Workshop | `intermediate/09-osint-workshop/challenge` | fictional source set | none |
| 10 | Python for Cybersecurity | `intermediate/10-python-for-cybersecurity/challenge` | Python, JSON/log parsing | none |
| 11 | Intro to Reverse Engineering | `intermediate/11-intro-to-reverse-engineering/challenge` | file, strings, GDB, radare2 | `./build.sh` |
| 12 | Intermediate CTF | `intermediate/12-intermediate-ctf` | multiple tools | `./setup.sh && docker compose up --build -d` |
| 13 | Advanced Capstone Prep | `intermediate/13-advanced-capstone-prep` | readiness case + checklist | none |
| 14 | Windows Security Fundamentals | `intermediate/14-windows-security-fundamentals/challenge` | Windows services/tasks/ACLs | none |
| 15 | HTTP Deep Dive | `intermediate/15-http-deep-dive/challenge` | HTTP request/response transcript | none |
| 16 | API Security Fundamentals | `intermediate/16-api-security-fundamentals/challenge` | API transcript | none |
| 17 | Wireless Security Analysis | `intermediate/17-wireless-security-analysis/challenge` | wireless event export | none |
| 18 | Vulnerability Assessment Fundamentals | `intermediate/18-vulnerability-assessment-fundamentals/challenge` | scan/context evidence | none |
| 19 | Intro to Active Directory | `intermediate/19-intro-active-directory/challenge` | AD CSV exports | none |
| 20 | Container Fundamentals for Security | `intermediate/20-container-fundamentals-security/challenge` | Dockerfile/Compose review | none |
| 21 | Cloud Security Fundamentals | `intermediate/21-cloud-security-fundamentals/challenge` | cloud JSON evidence | none |
| 22 | Intro to Detection Engineering | `intermediate/22-intro-detection-engineering/challenge` | process events | none |
| 23 | Git for Security / Secrets | `intermediate/23-git-security-secrets/challenge` | Git history/diff evidence | none |

---

## Cleanup

Use each challenge README as the source of truth.

Typical Docker cleanup:

~~~bash
docker compose down
~~~

Typical generated-evidence cleanup:

~~~bash
./reset.sh
~~~

when provided.

---

## Scope

Every Intermediate target is local, synthetic, fictional, or intentionally provided.

Members are expected to verify scope before using enumeration or testing tools.

---

## Navigation

- [Intermediate Track](README.md)
- [Curriculum Index](../CURRICULUM_INDEX.md)
- [Resources](../resources/README.md)
- [Extra Practice](../Extra%20Practice/README.md)
