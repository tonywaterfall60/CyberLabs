# Advanced Track

The Advanced track focuses on independent security analysis, controlled exploitation, enterprise-security concepts, defensive engineering, and integrated red/blue work.

Advanced members are expected to explain methodology, validate findings, state uncertainty, and stay within scope without constant instructor direction.

---

## Who This Track Is For

Advanced is intended for members who can already:

- perform structured enumeration,
- analyze packets and logs,
- use Burp and common Kali tools,
- automate simple analysis,
- reason about privilege boundaries,
- explain evidence and limitations,
- work independently in local lab environments.

Completion of the Intermediate track is the normal preparation.

---

## Prerequisites

Recommended knowledge:

- Intermediate network and web enumeration,
- Linux and Windows privilege-analysis fundamentals,
- packet and log correlation,
- Python basics,
- introductory reverse engineering,
- evidence-based reporting,
- strong understanding of authorization and scope.

For setup and tool references, see:

[../resources/README.md](../resources/README.md)

---

## Expected Independence

Advanced members should consistently be able to answer:

1. What is my question or hypothesis?
2. What evidence do I need?
3. Why is this tool or source appropriate?
4. What did I directly observe?
5. What am I inferring?
6. What evidence contradicts or limits my conclusion?
7. How did I validate the finding?
8. What is the impact?
9. How should it be remediated?
10. How could it be detected or monitored?
11. Am I still within authorized scope?

---

## Recommended Order

| # | Event | Main Focus | Lab / Environment |
|---:|---|---|---|
| 01 | [Advanced Web Security](01-advanced-web-security/) | authorization testing, telemetry, remediation | local web app |
| 02 | [Binary Analysis Foundations](02-binary-analysis-foundations/) | crash analysis and mitigation comparison | local toy ELF |
| 03 | [Active Directory Security](03-active-directory-security/) | identity graphs and attack-path reasoning | fictional AD exports |
| 04 | [Malware Analysis](04-malware-analysis/) | safe static/dynamic behavioral analysis | benign local sample |
| 05 | [Advanced Network Analysis](05-advanced-network-analysis/) | periodicity, timelines, hypotheses | synthetic PCAP |
| 06 | [Threat Hunting](06-threat-hunting/) | hypothesis-driven correlation | synthetic telemetry |
| 07 | [Detection Engineering](07-detection-engineering/) | rule logic, testing, tuning | JSONL + detection harness |
| 08 | [Cloud Security](08-cloud-security/) | IAM, storage, network, audit evidence | fictional cloud exports |
| 09 | [Container Security](09-container-security/) | build/image/runtime/host-boundary review | Docker definitions |
| 10 | [Exploit Development Foundations](10-exploit-development/) | controlled local ret2win | toy vulnerable binary |
| 11 | [Red vs. Blue Capstone](11-red-vs-blue-capstone/) | attack/detect/remediate correlation | local Docker app + telemetry |
| 12 | [API Exploitation & Authorization Testing](12-api-exploitation-authorization-testing/) | BOLA, function auth, mass assignment, token scope | synthetic API evidence |
| 13 | [Advanced AD / Identity Attack Paths](13-advanced-ad-identity-attack-paths/) | privilege paths, sessions, delegated rights | synthetic relationship graph |
| 14 | [Web Exploitation Chaining](14-web-exploitation-chaining/) | chaining multiple web weaknesses | synthetic web evidence |
| 15 | [SSRF & Internal Trust Boundaries](15-ssrf-internal-trust-boundaries/) | server-side fetch and internal reachability | architecture + request evidence |
| 16 | [Pivoting & Segmented Networks](16-pivoting-segmented-networks/) | routing, tunnels, segmented reachability | static network map |
| 17 | [Advanced Windows Internals](17-advanced-windows-internals/) | process, token, integrity, service context | static Windows evidence |
| 18 | [Memory Forensics Training Image](18-memory-forensics-training-image/) | memory evidence correlation | Volatility-style evidence / optional image |
| 19 | [Reverse Engineering II](19-reverse-engineering-ii/) | control-flow and validation reconstruction | synthetic disassembly |
| 20 | [Exploit Mitigations Deep Dive](20-exploit-mitigations-deep-dive/) | canaries, PIE, RELRO, NX, FORTIFY | mitigation comparison |
| 21 | [Threat Emulation & Detection Validation](21-threat-emulation-detection-validation/) | action-to-telemetry validation | synthetic emulation events |
| 22 | [SIEM Engineering](22-siem-engineering/) | normalization, schema drift, correlation | JSONL/CSV telemetry |
| 23 | [Advanced Cloud Identity](23-advanced-cloud-identity/) | trust policies, role chaining, workload identity | cloud identity evidence |
| 24 | [Kubernetes Security](24-kubernetes-security/) | workload, RBAC, secrets, network policy | Kubernetes YAML |
| 25 | [DevSecOps / Supply Chain II](25-devsecops-supply-chain-ii/) | provenance, SBOM, release trust | CI/SBOM/provenance evidence |
| 26 | [Incident Command / Major Incident Response](26-incident-command-major-incident-response/) | roles, decisions, containment, communication | incident case |
| 27 | [Professional Penetration-Test Reporting](27-professional-pentest-reporting/) | findings, executive summary, retest criteria | raw assessment notes |
| 28 | [Threat Modeling / Architecture Review](28-threat-modeling-architecture-review/) | trust boundaries, data flows, abuse cases | architecture evidence |

For a repository-wide view, see:

[../CURRICULUM_INDEX.md](../CURRICULUM_INDEX.md)

---

## Skills and Tool Progression

Advanced events may use:

~~~text
Web / Enumeration
  Burp Suite
  ffuf
  Gobuster
  Nmap
  Netcat
  curl

Binary / RE
  GDB
  checksec
  pwntools
  radare2 / Ghidra
  objdump / nm
  strace / ltrace
  YARA

Network / Detection
  Wireshark
  tshark
  tcpdump
  jq
  Python

Platforms
  Docker
  optional BloodHound / Neo4j when shared AD infrastructure exists
~~~

Advanced members should focus on **methodology and evidence quality**, not on running more aggressive tools.

---

## Infrastructure Model

Several Advanced events are fully local and reproducible on a Kali VM.

Where shared enterprise infrastructure does not yet exist, CyberLabs uses:

- fictional exported datasets,
- local containers,
- synthetic PCAPs,
- generated logs,
- benign compiled artifacts.

This keeps labs repeatable while preserving the intended reasoning skills.

Future shared-range improvements are tracked in:

[../ROADMAP.md](../ROADMAP.md)

---

## Flag Privacy

Filled-in flags are never stored in the student repository.

When a challenge supports a flag, the event lead can inject the private runtime value from the private instructor repository.

See:

[../resources/FLAG_PRIVACY.md](../resources/FLAG_PRIVACY.md)

---

## Expected Outcomes

By the end of Advanced, a member should be able to:

- formulate a testable security hypothesis,
- design an evidence-collection plan,
- correlate multiple sources,
- test competing explanations,
- safely validate controlled vulnerabilities,
- reason about enterprise identity and trust relationships,
- analyze benign suspicious samples,
- build and test detection logic,
- distinguish configuration exposure from observed use,
- compare vulnerable and hardened configurations,
- perform controlled exploit-development work in local toy binaries,
- connect offensive actions to defensive telemetry,
- recommend root-cause remediation and monitoring,
- communicate technical conclusions and limitations clearly.

---

## Typical Event Format

| Time | Activity |
|---|---|
| 0–15 min | Scenario / threat model |
| 15–35 min | Concepts / planning |
| 35–60 min | Demonstration or evidence orientation |
| 60–105 min | Independent investigation |
| 105–120+ min | Reporting / debrief |

Advanced events commonly run longer than Beginner or Intermediate.

---

## Capstone

The core track culminates in:

[11 — Red vs. Blue Capstone](11-red-vs-blue-capstone/)

The Advanced expansion then continues through Events 12–28, adding deeper specialization in API security, identity, web chaining, segmented networks, Windows internals, memory, reverse engineering, detection/SIEM, cloud/Kubernetes, supply chain, incident command, reporting, and architecture review.

The capstone connects:

~~~text
offensive validation
→ application/system decision
→ telemetry
→ detection
→ remediation
→ purple-team debrief
~~~

Advanced members should be able to defend their conclusions with evidence rather than relying on a flag or scanner result alone.

---

## Extra Practice

Advanced Extra Practice includes deeper DFIR, cloud, detection, AD, range, reverse-engineering, wireless, and red-team scenarios.

Browse:

[../Extra%20Practice/README.md](../Extra%20Practice/README.md)

---

## Navigation

- [CyberLabs Home](../README.md)
- [Curriculum Index](../CURRICULUM_INDEX.md)
- [Resources](../resources/README.md)
- [Extra Practice](../Extra%20Practice/README.md)
- [Roadmap](../ROADMAP.md)
