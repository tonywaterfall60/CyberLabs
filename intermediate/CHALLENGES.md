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
