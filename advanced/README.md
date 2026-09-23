# Advanced Track

The Advanced track focuses on deeper security analysis, controlled exploitation, enterprise-security concepts, threat detection, and integrated red/blue exercises.

Students are expected to work independently, explain methodology, validate findings, and stay within scope without constant instructor direction.

## Recommended Order

| # | Event | Main Skill |
|---:|---|---|
| 01 | [Advanced Web Security](01-advanced-web-security/) | authorization testing, Burp workflow, threat modeling |
| 02 | [Binary Analysis Foundations](02-binary-analysis-foundations/) | protections, debugging, unsafe code analysis |
| 03 | [Active Directory Security](03-active-directory-security/) | identity relationships, AD attack-path reasoning |
| 04 | [Malware Analysis](04-malware-analysis/) | safe static/dynamic analysis of benign sample |
| 05 | [Advanced Network Analysis](05-advanced-network-analysis/) | synthetic PCAP investigation |
| 06 | [Threat Hunting](06-threat-hunting/) | hypothesis-driven log hunting |
| 07 | [Detection Engineering](07-detection-engineering/) | detection logic and false-positive reasoning |
| 08 | [Cloud Security](08-cloud-security/) | IAM, storage, network configuration review |
| 09 | [Container Security](09-container-security/) | Dockerfile/image/runtime review |
| 10 | [Exploit Development Foundations](10-exploit-development/) | controlled memory-corruption lab |
| 11 | [Red vs. Blue Capstone](11-red-vs-blue-capstone/) | integrated attack, detection, reporting |

## Kali Tool Progression

Advanced events may use:

- Burp Suite
- ffuf / Gobuster
- Nmap / Netcat
- GDB / pwndbg or GEF if installed
- pwntools
- checksec
- radare2 / Ghidra
- YARA
- strace / ltrace
- Wireshark / tshark / tcpdump
- jq
- Python
- Docker
- optional BloodHound / Neo4j when shared AD infrastructure exists

## Infrastructure Notes

Several Advanced events work entirely on a Kali VM using local challenge data.

These become more realistic with shared infrastructure:

- Active Directory Security
- SIEM/detection engineering
- Red vs. Blue exercises

Until a shared cyber range exists, those events use fictional exported data, local containers, and synthetic logs.

## Flag Privacy

Filled-in flags are never stored here.

When a challenge supports a flag, the instructor injects the private value at runtime from the private instructor repository.

## Expectations

Advanced students should consistently answer:

1. What is my hypothesis?
2. What evidence supports it?
3. What evidence contradicts it?
4. How did I validate the finding?
5. What is the security impact?
6. How would a defender detect or prevent it?
7. Am I still within scope?
