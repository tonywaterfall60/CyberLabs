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

The track culminates in:

[11 — Red vs. Blue Capstone](11-red-vs-blue-capstone/)

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
