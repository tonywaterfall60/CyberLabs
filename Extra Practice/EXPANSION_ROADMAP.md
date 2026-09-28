# Extra Practice Expansion Roadmap

This roadmap combines the selected defensive/forensics labs with the red-team labs discussed for the next CyberLabs expansion.

Completed labs remain 01–15. The next expansion is intentionally numbered 16–35 so every planned lab has a unique slot.

| # | Lab | Type | Status |
|---:|---|---|---|
| 16 | Internal Network Penetration Test | Red Team | Complete |
| 17 | Email / Phishing Forensics | Forensics / Blue | Complete |
| 18 | Memory Forensics Foundations | Forensics / Blue | Complete |
| 19 | Windows Event Log Investigation | DFIR / Blue | Complete |
| 20 | Linux Privilege Escalation Challenge | Red Team | Complete |
| 21 | Windows Privilege Escalation Challenge | Red Team | Complete |
| 22 | API Exploitation Lab | Red Team | Complete |
| 23 | SSRF and Internal Service Discovery | Red Team | Complete |
| 24 | Web Exploitation Chain | Red Team | Complete |
| 25 | Credential Attack Lab | Red Team | Complete |
| 26 | Active Directory Red-Team Range | Red Team | Complete |
| 27 | Vulnerability Management / Triage | Defensive / Assessment | Complete |
| 28 | Pivoting and Lateral Movement Range | Red Team | Complete |
| 29 | Red-Team Assessment Capstone | Red Team | Complete |
| 30 | SOC Shift Challenge | Blue Team / SOC | Complete |
| 31 | File Upload Security Challenge | Red Team / Web | Complete |
| 32 | Path Traversal / LFI Investigation | Red Team / Web | Complete |
| 33 | Command Injection Lab | Red Team / Web | Complete |
| 34 | SQL Injection Deep Dive | Red Team / Web | Complete |
| 35 | Purple-Team Operator Challenge | Purple Team | Complete |

## Build Order

Work in small chunks:

~~~text
16–19  foundational range + forensics
20–23  privilege escalation + API/SSRF
24–27  web chain + credentials + AD + vulnerability triage
28–31  pivoting + red capstone + SOC + upload security
32–35  traversal + command injection + SQLi + purple operator
~~~

## Design Rules

- local/synthetic infrastructure only
- explicit authorized scope
- no real university/public targets
- instructor-only private flags when needed
- evidence and reporting required
- advanced offensive labs should include remediation/detection context
- no automatic checker required unless explicitly added later