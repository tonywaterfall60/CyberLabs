# Intermediate Track

The Intermediate track moves members from guided fundamentals into structured analysis, enumeration, security testing, automation, and multi-step problem solving.

## Recommended Order

| # | Event | Main Skill | Challenge |
|---:|---|---|---|
| 01 | [Network Enumeration](01-network-enumeration/) | Structured service discovery | Multi-service local target |
| 02 | [Web Enumeration](02-web-enumeration/) | Application mapping | Local web app |
| 03 | [OWASP Top 10 Workshop](03-owasp-top-10/) | Web risk categories | Vulnerability classification |
| 04 | [Password Security](04-password-security/) | Password storage & auditing | Hash-analysis exercise |
| 05 | [Linux Privilege Escalation Foundations](05-linux-privilege-escalation/) | Permission/misconfiguration review | Local Linux audit |
| 06 | [Windows Privilege Escalation Foundations](06-windows-privilege-escalation/) | Windows security posture | Configuration triage |
| 07 | [Packet Analysis Challenge](07-packet-analysis/) | PCAP investigation | Local generated traffic |
| 08 | [Log Analysis](08-log-analysis/) | Event correlation | Authentication incident |
| 09 | [OSINT Workshop](09-osint-workshop/) | Public-data methodology | Fictional investigation |
| 10 | [Python for Cybersecurity](10-python-for-cybersecurity/) | Automation | Log parser |
| 11 | [Intro to Reverse Engineering](11-intro-to-reverse-engineering/) | Binary inspection | Toy program analysis |
| 12 | [Intermediate CTF](12-intermediate-ctf/) | Skill integration | Multi-category capstone |
| 13 | [Advanced Capstone Prep](13-advanced-capstone-prep/) | Advancement readiness | Mock interview prep |

## Member Workflow

Clone once:

```bash
git clone https://github.com/tonywaterfall60/CyberLabs.git
cd CyberLabs
```

Before each meeting:

```bash
git pull
```

Then enter the event folder and read its `README.md`.

## Expected Outcomes

By the end of Intermediate, a member should be able to:

- perform structured network and web enumeration in an authorized lab
- classify common web security weaknesses
- explain secure password storage and basic password-auditing concepts
- identify common Linux and Windows privilege-escalation conditions
- analyze packets and logs to form an incident timeline
- use ethical OSINT methodology on provided fictional/public training data
- automate repetitive analysis with Python
- inspect a simple compiled program using static-analysis tools
- communicate findings, mitigations, and scope clearly

## Typical Event Format

| Time | Activity |
|---|---|
| 0–10 min | Review / scenario |
| 10–30 min | Concepts |
| 30–45 min | Demo |
| 45–75 min | Hands-on lab |
| 75–90 min | Challenge / debrief |

## Advancement

After the Intermediate CTF, members may take the Intermediate → Advanced mock interview.
