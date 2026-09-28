# CyberLabs Curriculum Roadmap

This roadmap tracks the intended development of the SRU Cyber Club curriculum.

The curriculum is designed around three stages:

```text
Beginner
   ↓
Intermediate
   ↓
Advanced
```

Members progress through hands-on events, challenge nights, CTFs, and capstone interviews.

---

# Beginner Track

**Status: Core track built**

## Events

- [x] 01 — Intro to Cybersecurity
- [x] 02 — Linux Basics
- [x] 03 — Networking Fundamentals
- [x] 04 — Command Line Workshop
- [x] 05 — Intro to Wireshark
- [x] 06 — Intro to Nmap
- [x] 07 — Web Security Basics
- [x] 08 — Intro to Cryptography
- [x] 09 — Intro to Digital Forensics
- [x] 10 — Beginner CTF
- [x] 11 — Beginner → Intermediate Capstone Prep

## Planned Improvements

- [x] add more Kali-specific tool practice
- [ ] expand PCAP challenge variety
- [ ] add optional Windows equivalents
- [ ] improve diagrams/screenshots
- [ ] add event presentation links

---

# Intermediate Track

**Status: Core track built**

## Events

- [x] 01 — Network Enumeration
- [x] 02 — Web Enumeration
- [x] 03 — OWASP Top 10 Workshop
- [x] 04 — Password Security
- [x] 05 — Linux Privilege Escalation Foundations
- [x] 06 — Windows Privilege Escalation Foundations
- [x] 07 — Packet Analysis Challenge
- [x] 08 — Log Analysis
- [x] 09 — OSINT Workshop
- [x] 10 — Python for Cybersecurity
- [x] 11 — Intro to Reverse Engineering
- [x] 12 — Intermediate CTF
- [x] 13 — Intermediate → Advanced Capstone Prep

## Kali Tool Expansion

Planned/in progress:

- [x] Nmap
- [x] curl
- [x] Wireshark
- [x] Burp Suite
- [x] Gobuster
- [x] ffuf
- [x] Nikto
- [x] tcpdump / tshark
- [x] hashid / hashcat
- [ ] John the Ripper
- [x] GDB / radare2

---

# Advanced Track

**Status: Core local track built; shared-range upgrades remain**

## Planned Events

- [x] Advanced Web Security outline
- [x] Binary Analysis Foundations outline
- [x] Active Directory Security
- [x] Windows domain enumeration (static/exported-data version)
- [x] enterprise identity/security concepts
- [x] advanced web security local lab
- [x] binary exploitation foundations
- [x] malware analysis (benign simulation)
- [x] advanced network analysis
- [x] threat hunting
- [x] detection engineering
- [ ] SIEM investigation
- [x] cloud security
- [x] container security
- [x] exploit-development / vulnerability-analysis foundations
- [x] local red vs. blue capstone

---

# Infrastructure Roadmap

## Phase 1 — Distributed Labs

- [x] GitHub-hosted curriculum
- [x] local Bash-generated challenges
- [x] local Docker challenges
- [x] Kali VM workflow
- [x] standardized Kali VM setup guide
- [ ] optional Windows VM guide

## Phase 2 — Shared Range

- [ ] dedicated Proxmox host
- [ ] isolated Beginner network
- [ ] isolated Intermediate network
- [ ] isolated Advanced network
- [ ] reusable VM templates
- [ ] VPN-based member access
- [ ] reset/snapshot workflow

## Phase 3 — Enterprise Lab

- [ ] Windows Server domain controller
- [ ] Windows client systems
- [ ] Linux servers
- [ ] firewall/router VM
- [ ] SIEM
- [ ] red/blue team networks
- [ ] centralized logging

---

# Career Development

Planned additions:

- [x] Beginner → Intermediate mock interview structure
- [x] Intermediate → Advanced mock interview structure
- [ ] resume workshop
- [ ] SOC analyst mock interview
- [ ] penetration-testing mock interview
- [ ] incident-response tabletop
- [ ] technical report-writing workshop
- [ ] alumni/industry speaker events

---

# Repository Improvements

- [x] standard event layout
- [x] challenge index files
- [x] local scope/safety guidance
- [x] `SRU{}` flag format
- [ ] standardized screenshots/diagrams
- [ ] release tags by semester
- [ ] GitHub issue labels
- [ ] GitHub project board
- [ ] automated Markdown/link checks
- [ ] automated flag/answer checker and challenge validation

The roadmap should be updated as events are tested during real club meetings.


---

# Future Curriculum Expansion

These items track the curriculum expansion. Completed items are marked below.

## Beginner Expansion

Planned additions:

- [x] Cybersecurity Lab Safety & Scoping
- [x] Windows Fundamentals for Cybersecurity
- [x] Identity & Access Basics
- [x] Intro to Wireless Security
- [x] Intro to Security Monitoring
- [x] Basic Incident Response

Design goal:

~~~text
foundations
→ safe lab habits
→ Linux + Windows familiarity
→ networking/web/identity
→ monitoring/IR awareness
→ Beginner CTF
~~~

---

## Intermediate Expansion

Planned additions:

- [ ] Windows Security Fundamentals
- [ ] HTTP Deep Dive
- [ ] API Security Fundamentals
- [ ] Wireless Security Analysis
- [ ] Vulnerability Assessment Fundamentals
- [ ] Intro to Active Directory
- [ ] Container Fundamentals for Security
- [ ] Cloud Security Fundamentals
- [ ] Intro to Detection Engineering
- [ ] Git for Security / Secrets in Repositories

Design goal:

~~~text
independent tool selection
→ deeper protocol/application understanding
→ enterprise identity/platform fundamentals
→ validation and prioritization
→ Intermediate CTF
~~~

---

## Advanced Expansion

Planned additions:

- [ ] API Exploitation & Authorization Testing
- [ ] Advanced Active Directory / Identity Attack Paths
- [ ] Web Exploitation Chaining
- [ ] SSRF & Internal Trust Boundaries
- [ ] Pivoting & Segmented Networks
- [ ] Advanced Windows Internals
- [ ] Memory Forensics with a Real Training Image
- [ ] Reverse Engineering II
- [ ] Exploit Mitigations Deep Dive
- [ ] Threat Emulation & Detection Validation
- [ ] SIEM Engineering
- [ ] Advanced Cloud Identity
- [ ] Kubernetes Security
- [ ] DevSecOps / Supply Chain II
- [ ] Incident Command / Major Incident Response
- [ ] Professional Penetration-Test Reporting
- [ ] Threat Modeling / Architecture Review

Design goal:

~~~text
hypothesis
→ multi-source evidence
→ attack/defense validation
→ system-level reasoning
→ remediation/detection
→ professional reporting
~~~

---

# Specialization Badges / Mini Paths

Planned specialization system. Members would still be able to complete the normal Beginner → Intermediate → Advanced progression, but could also earn focused badges by completing selected main-track and Extra Practice labs.

## Red Team Badge

Planned path:

~~~text
Web
→ API
→ privilege escalation
→ Active Directory
→ pivoting
→ exploit development
→ red-team assessment
~~~

- [ ] define required core events
- [ ] define required Extra Practice labs
- [ ] define capstone requirement
- [ ] define badge completion standard

## Blue Team Badge

Planned path:

~~~text
logs
→ packet analysis
→ threat hunting
→ detection engineering
→ incident response
→ SIEM
~~~

- [ ] define required core events
- [ ] define required Extra Practice labs
- [ ] define SOC/IR capstone requirement
- [ ] define badge completion standard

## DFIR Badge

Planned path:

~~~text
disk/file forensics
→ Windows logs
→ memory
→ network
→ full incident response
~~~

- [ ] define required evidence-handling standard
- [ ] define required forensic labs
- [ ] define case-report requirement

## Cloud / DevSecOps Badge

Planned path:

~~~text
containers
→ IAM
→ cloud security
→ CI/CD
→ supply chain
→ Kubernetes
~~~

- [ ] define required platform labs
- [ ] define architecture-review requirement
- [ ] define hardening capstone

## Reverse Engineering Badge

Planned path:

~~~text
intro reverse engineering
→ binary analysis
→ malware analysis
→ exploit development
→ Reverse Engineering II
~~~

- [ ] define required reversing labs
- [ ] define static/dynamic analysis requirement
- [ ] define final reversing challenge

## Badge Platform Requirements

Future badge support should eventually include:

- [ ] member identity/profile
- [ ] prerequisite tracking
- [ ] completed-lab tracking
- [ ] badge progress
- [ ] badge award history
- [ ] instructor override/approval
- [ ] ability to earn multiple badges
- [ ] public/private profile controls

---

# Automated Lab Validation

Goal: allow members to complete many CyberLabs exercises independently without an instructor being present.

**Status: planned only. No checker is implemented yet.**

## Planned Capabilities

- [ ] standardized per-lab validation interface
- [ ] flag submission
- [ ] short-answer validation where appropriate
- [ ] multiple-answer / normalized-answer support
- [ ] case-insensitive or whitespace-normalized answers where appropriate
- [ ] partial completion tracking
- [ ] hints without immediately revealing solutions
- [ ] attempt history
- [ ] local/offline validation option
- [ ] instructor-hosted validation option
- [ ] private expected answers kept outside the student repository
- [ ] private flags kept outside the student repository
- [ ] compatibility with runtime-injected flags
- [ ] validation for non-flag labs using evidence-derived answers
- [ ] completion event emitted for future leaderboard/profile system

## Important Design Constraint

The checker should not reduce labs to only finding a flag.

Where practical, completion should support several categories:

~~~text
objective/flag
+ key evidence questions
+ required analysis answers
+ optional instructor review for reports
~~~

Examples:

~~~text
What host exposed the service?
What user/session was involved?
What vulnerability class was demonstrated?
What was the derived offset?
What BSSID belonged to the open training AP?
~~~

## Possible Architecture

Future options to evaluate:

~~~text
Student lab
   ↓
local checker CLI or web UI
   ↓
submission API
   ↓
private answer/flag store
   ↓
completion record
~~~

No architecture choice has been finalized.

## Security Requirements

- [ ] never ship real answer keys in the student repository
- [ ] never expose private flags through client-side validation
- [ ] rate-limit hosted submissions
- [ ] prevent one user from submitting completion for another user
- [ ] separate instructor/admin privileges from member privileges
- [ ] log validation events
- [ ] support flag rotation
- [ ] avoid storing real passwords or unnecessary personal information
- [ ] document threat model before implementation

---

# Member Progress / Leaderboard Platform

Goal: eventually track what members have completed and provide an optional club leaderboard.

**Status: planned only. No leaderboard or member-tracking service is implemented yet.**

## Planned Member Progress

- [ ] member profile
- [ ] Beginner completion count
- [ ] Intermediate completion count
- [ ] Advanced completion count
- [ ] Extra Practice completion count
- [ ] individual lab completion history
- [ ] specialization badge progress
- [ ] capstone completion
- [ ] total challenges completed

## Planned Leaderboard Views

Potential views:

~~~text
Overall labs completed
Extra Practice completed
Track completion
Current semester
Specialization badges
CTF/challenge completions
~~~

The leaderboard should reward **participation and completion**, not encourage unsafe behavior or competition against systems outside CyberLabs.

## Privacy / Fairness Considerations

Before implementation:

- [ ] decide whether leaderboard participation is opt-in
- [ ] allow members to hide their profile/rank
- [ ] minimize stored personal data
- [ ] define how aliases/display names work
- [ ] decide how instructor/manual completions are recorded
- [ ] prevent duplicate/fraudulent completion submissions
- [ ] decide whether hints affect scoring
- [ ] avoid rewarding brute-force submission volume
- [ ] define semester resets vs. lifetime statistics

## Potential Future Integration

~~~text
Lab checker
   ↓
validated completion
   ↓
member progress database
   ├── track progress
   ├── badge engine
   └── leaderboard
~~~

This should be designed only after the lab-validation format is standardized.

---

# Expansion Implementation Order

When work resumes, use small chunks.

Recommended order:

~~~text
1. Finish planned Extra Practice 20–35
2. Add Beginner expansion events
3. Add Intermediate expansion events
4. Add Advanced expansion events
5. Define specialization/badge requirements
6. Standardize lab metadata and validation format
7. Build automated flag/answer checker
8. Add member progress tracking
9. Add badge engine
10. Add optional leaderboard
~~~

The checker/leaderboard should come **after** lab metadata and answer formats are standardized so existing labs do not require repeated migrations.
