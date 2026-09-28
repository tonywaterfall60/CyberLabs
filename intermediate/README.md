# Intermediate Track

The Intermediate track moves members from guided fundamentals into structured analysis, enumeration, security testing, automation, and multi-step problem solving.

Members should increasingly be able to choose a tool because it answers a specific question, validate automated output, and explain what the available evidence does and does not prove.

---

## Who This Track Is For

Intermediate is intended for members who can already:

- navigate Kali/Linux comfortably,
- explain basic networking and HTTP concepts,
- use Wireshark and Nmap at a basic level,
- follow lab scope without constant reminders,
- document observations clearly.

Completion of the Beginner track is the normal preparation.

---

## Prerequisites

Recommended knowledge:

- Linux command-line basics,
- IP/DNS/TCP/UDP/ports,
- basic packet analysis,
- basic Nmap usage,
- HTTP requests/responses,
- hashing/encoding fundamentals,
- evidence-handling basics.

For setup and tool references, see:

[../resources/README.md](../resources/README.md)

---

## Expected Independence

Intermediate members are expected to:

- define the question they are trying to answer,
- select an appropriate tool or evidence source,
- manually validate important automated findings,
- correlate more than one source when needed,
- explain security impact,
- propose remediation or next steps,
- identify uncertainty and missing evidence.

Instructor guidance is still available, but the workflow should be increasingly student-driven.

---

## Recommended Order

| # | Event | Main Focus | Lab / Environment |
|---:|---|---|---|
| 01 | [Network Enumeration](01-network-enumeration/) | structured service discovery | multi-service local target |
| 02 | [Web Enumeration](02-web-enumeration/) | application mapping and Burp workflow | local web app |
| 03 | [OWASP Top 10 Workshop](03-owasp-top-10/) | web-risk analysis and prevention | vulnerability review |
| 04 | [Password Security](04-password-security/) | password storage and auditing | toy hashes + policy evidence |
| 05 | [Linux Privilege Escalation Foundations](05-linux-privilege-escalation/) | privilege-boundary analysis | safe static Linux audit |
| 06 | [Windows Privilege Escalation Foundations](06-windows-privilege-escalation/) | Windows security posture | fictional evidence bundle |
| 07 | [Packet Analysis Challenge](07-packet-analysis/) | PCAP investigation | generated local traffic |
| 08 | [Log Analysis](08-log-analysis/) | multi-source event correlation | generated logs |
| 09 | [OSINT Workshop](09-osint-workshop/) | provenance, corroboration, confidence | fictional OSINT case |
| 10 | [Python for Cybersecurity](10-python-for-cybersecurity/) | analysis automation | log parser |
| 11 | [Intro to Reverse Engineering](11-intro-to-reverse-engineering/) | static/dynamic binary analysis | toy ELF |
| 12 | [Intermediate CTF](12-intermediate-ctf/) | cross-topic skill integration | multi-category capstone |
| 13 | [Advanced Capstone Prep](13-advanced-capstone-prep/) | Advanced readiness | multi-domain practice case |
| 14 | [Windows Security Fundamentals](14-windows-security-fundamentals/) | Windows services, tasks, ACLs, telemetry | static Windows evidence |
| 15 | [HTTP Deep Dive](15-http-deep-dive/) | methods, redirects, cookies, cache, CORS | HTTP transcript |
| 16 | [API Security Fundamentals](16-api-security-fundamentals/) | JSON APIs, tokens, object authorization | API transcript |
| 17 | [Wireless Security Analysis](17-wireless-security-analysis/) | management frames and client behavior | synthetic wireless export |
| 18 | [Vulnerability Assessment Fundamentals](18-vulnerability-assessment-fundamentals/) | scanner validation and prioritization | scanner + context evidence |
| 19 | [Intro to Active Directory](19-intro-active-directory/) | users, groups, SPNs, nesting | fictional AD exports |
| 20 | [Container Fundamentals for Security](20-container-fundamentals-security/) | images, containers, ports, volumes | Dockerfile/Compose review |
| 21 | [Cloud Security Fundamentals](21-cloud-security-fundamentals/) | IAM, storage, network, audit | fictional cloud JSON |
| 22 | [Intro to Detection Engineering](22-intro-detection-engineering/) | fields, detections, positive/negative tests | synthetic process events |
| 23 | [Git for Security / Secrets](23-git-security-secrets/) | Git history, secret exposure, rotation | static Git evidence |

For a repository-wide view, see:

[../CURRICULUM_INDEX.md](../CURRICULUM_INDEX.md)

---

## Skills and Tool Progression

Intermediate commonly uses:

~~~text
Network / Services
  Nmap
  Netcat
  curl
  tshark
  tcpdump

Web
  Burp Suite
  Gobuster
  ffuf
  Nikto
  curl

Passwords
  hashid
  hashcat
  John the Ripper where appropriate

Analysis
  jq
  grep
  Python

Reverse Engineering
  file
  strings
  readelf
  objdump
  checksec
  GDB
  radare2 / rabin2
~~~

The goal is not tool collection. Members should be able to explain **why a tool was selected and how its output was validated**.

---

## Expected Outcomes

By the end of Intermediate, a member should be able to:

- perform structured network and web enumeration in an authorized lab,
- manually validate discovered services and web behavior,
- classify common web weaknesses,
- explain secure password storage and password-auditing concepts,
- identify Linux and Windows privilege-escalation conditions,
- analyze packet captures and logs to form timelines,
- use ethical OSINT methodology on fictional/provided data,
- automate repetitive analysis with Python,
- inspect a compiled program using static and dynamic techniques,
- separate observation from interpretation,
- state missing evidence and uncertainty,
- communicate impact, remediation, and scope clearly.

---

## Typical Event Format

| Time | Activity |
|---|---|
| 0–10 min | Review / scenario |
| 10–30 min | Concepts |
| 30–45 min | Demo |
| 45–75 min | Hands-on lab |
| 75–90 min | Challenge / debrief |

Some Intermediate labs may run longer when correlation or troubleshooting is required.

---

## CTF and Advancement

The Intermediate CTF is the primary cross-domain skill-integration event.

After the CTF, members can use:

[13 — Advanced Capstone Prep](13-advanced-capstone-prep/)

to prepare for the Intermediate → Advanced readiness interview.

Members moving into Advanced should be ready to transition from:

~~~text
structured analysis
→ independent hypothesis-driven investigation
~~~

After the core readiness event, the Intermediate expansion continues through Events 14–23.

Continue to Advanced after completing the expansion or when the event lead confirms readiness:

[Advanced Track](../advanced/README.md)

---

## Extra Practice

Useful Intermediate and Intermediate → Advanced independent labs are listed in:

[../Extra%20Practice/README.md](../Extra%20Practice/README.md)

Extra Practice is recommended when a member wants more repetition before advancement.

---

## Navigation

- [CyberLabs Home](../README.md)
- [Curriculum Index](../CURRICULUM_INDEX.md)
- [Resources](../resources/README.md)
- [Extra Practice](../Extra%20Practice/README.md)
- [Roadmap](../ROADMAP.md)
