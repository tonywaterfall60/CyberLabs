# Extra Practice

Additional hands-on CyberLabs exercises for members who want more repetition outside the main Beginner, Intermediate, and Advanced event tracks.

Extra Practice is designed for:

- independent practice,
- open lab nights,
- review before advancement,
- targeted remediation,
- specialization practice,
- members who want additional challenge outside the normal event sequence.

These labs are optional unless an event lead says otherwise.

---

## Start Here

From the CyberLabs repository:

~~~bash
git pull
cd "Extra Practice"
~~~

Choose a lab and read its README before starting anything.

Example:

~~~bash
cd 01-linux-incident-investigation
cat README.md
~~~

If you are looking for a specific skill area, use [Browse by Focus](#browse-by-focus).

For every current CyberLabs event and lab in one place, see:

[../CURRICULUM_INDEX.md](../CURRICULUM_INDEX.md)

---

# Current Lab Catalog

This numbered catalog is the canonical Extra Practice list.

| # | Lab | Difficulty | Main Skills | Infrastructure |
|---:|---|---|---|---|
| 01 | [Linux Incident Investigation](01-linux-incident-investigation/) | Beginner → Intermediate | Linux, grep, find, logs, evidence handling | local generated filesystem |
| 02 | [Network Service Triage](02-network-service-triage/) | Intermediate | Nmap, curl, Netcat, service prioritization | 3 local Docker services |
| 03 | [Web Application Mapping](03-web-application-mapping/) | Intermediate | Burp, curl, ffuf/Gobuster, route mapping | local Flask app |
| 04 | [Packet Investigation](04-packet-investigation/) | Intermediate → Advanced | Wireshark, tshark, timelines | generated synthetic PCAP |
| 05 | [Authentication Incident](05-authentication-incident/) | Intermediate → Advanced | auth/MFA/VPN/app correlation, Python | generated multi-source logs |
| 06 | [Container Security Audit](06-container-security-audit/) | Advanced | Dockerfile/Compose review, hardening | local image + static runtime config |
| 07 | [Reverse Engineering Drill](07-reverse-engineering-drill/) | Intermediate → Advanced | GDB, radare2, strings, checksec | compiled stripped ELF artifact |
| 08 | [Purple-Team Mini Range](08-purple-team-mini-range/) | Advanced | Burp, web authz, logs, detection | Nginx + portal + API multi-container range |
| 09 | [SIEM / Detection Investigation](09-siem-detection-investigation/) | Advanced | jq, Python, detection tuning, correlation | generated normalized JSONL telemetry |
| 10 | [Cloud / IAM Review](10-cloud-iam-review/) | Advanced | IAM, storage, security groups, audit logs | static fictional cloud exports |
| 11 | [Full Incident Response Case](11-full-incident-response-case/) | Advanced | identity, endpoint, network, app correlation | generated case bundle + PCAP + host artifacts |
| 12 | [Active Directory Relationship Analysis](12-active-directory-relationship-analysis/) | Advanced | nested groups, SPNs, delegation, graph reasoning | fictional AD export dataset |
| 13 | [DevSecOps Pipeline Review](13-devsecops-pipeline-review/) | Advanced | CI/CD, secrets, containers, supply-chain controls | fictional repository + pipeline snapshot |
| 14 | [Multi-Host Cyber Range Investigation](14-multi-host-cyber-range/) | Advanced | subnet enumeration, service mapping, logs, prioritization | 5-host dedicated Docker subnet |
| 15 | [Wireless Security Analysis](15-wireless-security-analysis/) | Intermediate → Advanced | 802.11 frames, Wireshark, tshark, aircrack-ng | generated synthetic Wi-Fi PCAP |
| 16 | [Internal Network Penetration Test](16-internal-network-penetration-test/) | Intermediate → Advanced | subnet discovery, service enumeration, attack-path validation | isolated 4-host Docker subnet |
| 17 | [Email / Phishing Forensics](17-email-phishing-forensics/) | Intermediate → Advanced | raw email headers, SPF/DKIM/DMARC, URL analysis, timelines | fictional .eml evidence package |
| 18 | [Memory Forensics Foundations](18-memory-forensics-foundations/) | Advanced | process trees, netscan, cmdline, filescan, malfind reasoning | synthetic Volatility-style exports |
| 19 | [Windows Event Log Investigation](19-windows-event-log-investigation/) | Intermediate → Advanced | Security, Sysmon, PowerShell, Task Scheduler correlation | synthetic JSONL event exports |
| 20 | [Linux Privilege Escalation Challenge](20-linux-privilege-escalation-challenge/) | Advanced | sudo/cron/permissions, privilege-boundary reasoning | static Linux evidence |
| 21 | [Windows Privilege Escalation Challenge](21-windows-privilege-escalation-challenge/) | Advanced | services, tasks, ACLs, startup analysis | static Windows evidence |
| 22 | [API Exploitation Lab](22-api-exploitation-lab/) | Advanced | BOLA, mass assignment, token scope | local Flask API |
| 23 | [SSRF and Internal Service Discovery](23-ssrf-internal-service-discovery/) | Advanced | SSRF, trust boundaries, internal service mapping | multi-container range |
| 24 | [Web Exploitation Chain](24-web-exploitation-chain/) | Advanced | information disclosure + authz chaining | local Flask app |
| 25 | [Credential Attack Lab](25-credential-attack-lab/) | Intermediate → Advanced | password auditing, rate limits, spray reasoning | toy hashes + local simulator |
| 26 | [Active Directory Red-Team Range](26-active-directory-red-team-range/) | Advanced | AD graph paths, sessions, delegation | fictional AD exports |
| 27 | [Vulnerability Management / Triage](27-vulnerability-management-triage/) | Intermediate → Advanced | scanner validation, risk prioritization | scanner + asset evidence |
| 28 | [Pivoting and Lateral Movement Range](28-pivoting-lateral-movement-range/) | Advanced | SSH SOCKS pivoting, segmented networks | dual-network Docker range |
| 29 | [Red-Team Assessment Capstone](29-red-team-assessment-capstone/) | Advanced Capstone | full scoped assessment + reporting | isolated multi-host range |
| 30 | [SOC Shift Challenge](30-soc-shift-challenge/) | Advanced | alert triage, correlation, handoff | synthetic SOC queue |
| 31 | [File Upload Security Challenge](31-file-upload-security-challenge/) | Intermediate → Advanced | upload validation, storage, serving | local upload app |
| 32 | [Path Traversal / LFI Investigation](32-path-traversal-lfi-investigation/) | Intermediate → Advanced | path normalization, bounded traversal | local document viewer |
| 33 | [Command Injection Lab](33-command-injection-lab/) | Advanced | shell injection, secure subprocess design | isolated diagnostics app |
| 34 | [SQL Injection Deep Dive](34-sql-injection-deep-dive/) | Advanced | UNION, boolean oracle, parameterization | local Flask + SQLite |
| 35 | [Purple-Team Operator Challenge](35-purple-team-operator-challenge/) | Advanced Capstone | adversary emulation + telemetry + detection | local app + JSONL logs |

Expansion history and build status are tracked in:

[EXPANSION_ROADMAP.md](EXPANSION_ROADMAP.md)

---

# Browse by Focus

The same labs can fit more than one focus area. These groups are navigation aids only; they do **not** change the numbered catalog.

## Red Team / Penetration Testing

Good choices for members interested in enumeration, attack paths, web testing, and authorized offensive methodology.

| Lab | Main Practice |
|---|---|
| [02 — Network Service Triage](02-network-service-triage/) | service discovery and manual validation |
| [03 — Web Application Mapping](03-web-application-mapping/) | attack-surface and route mapping |
| [08 — Purple-Team Mini Range](08-purple-team-mini-range/) | controlled web authorization validation |
| [12 — Active Directory Relationship Analysis](12-active-directory-relationship-analysis/) | identity and privilege-path reasoning |
| [14 — Multi-Host Cyber Range Investigation](14-multi-host-cyber-range/) | multi-host enumeration and prioritization |
| [15 — Wireless Security Analysis](15-wireless-security-analysis/) | offline wireless reconnaissance/analysis |
| [16 — Internal Network Penetration Test](16-internal-network-penetration-test/) | scoped internal assessment and attack path |
| [20 — Linux Privilege Escalation Challenge](20-linux-privilege-escalation-challenge/) | Linux privilege-boundary analysis |
| [21 — Windows Privilege Escalation Challenge](21-windows-privilege-escalation-challenge/) | Windows privilege-boundary analysis |
| [22 — API Exploitation Lab](22-api-exploitation-lab/) | API authorization and workflow weaknesses |
| [23 — SSRF and Internal Service Discovery](23-ssrf-internal-service-discovery/) | server-side fetch and internal trust |
| [24 — Web Exploitation Chain](24-web-exploitation-chain/) | multi-step web attack path |
| [25 — Credential Attack Lab](25-credential-attack-lab/) | controlled credential auditing |
| [26 — Active Directory Red-Team Range](26-active-directory-red-team-range/) | identity-path analysis |
| [28 — Pivoting and Lateral Movement Range](28-pivoting-lateral-movement-range/) | segmented-network reachability |
| [29 — Red-Team Assessment Capstone](29-red-team-assessment-capstone/) | end-to-end scoped assessment |
| [31 — File Upload Security Challenge](31-file-upload-security-challenge/) | upload validation and storage |
| [32 — Path Traversal / LFI Investigation](32-path-traversal-lfi-investigation/) | path handling |
| [33 — Command Injection Lab](33-command-injection-lab/) | safe local command-injection analysis |
| [34 — SQL Injection Deep Dive](34-sql-injection-deep-dive/) | SQL injection analysis |
| [35 — Purple-Team Operator Challenge](35-purple-team-operator-challenge/) | adversary emulation + detection |

Related main-track material:

- [Intermediate Network Enumeration](../intermediate/01-network-enumeration/)
- [Intermediate Web Enumeration](../intermediate/02-web-enumeration/)
- [Advanced Web Security](../advanced/01-advanced-web-security/)
- [Advanced Active Directory Security](../advanced/03-active-directory-security/)
- [Advanced Exploit Development](../advanced/10-exploit-development/)

---

## Blue Team / SOC

Good choices for members interested in alert triage, correlation, detection, and security monitoring.

| Lab | Main Practice |
|---|---|
| [04 — Packet Investigation](04-packet-investigation/) | network evidence and timelines |
| [05 — Authentication Incident](05-authentication-incident/) | identity/MFA/VPN/app correlation |
| [08 — Purple-Team Mini Range](08-purple-team-mini-range/) | offensive action to defensive telemetry |
| [09 — SIEM / Detection Investigation](09-siem-detection-investigation/) | normalized telemetry and detection tuning |
| [11 — Full Incident Response Case](11-full-incident-response-case/) | multi-source incident analysis |
| [15 — Wireless Security Analysis](15-wireless-security-analysis/) | wireless monitoring concepts |
| [19 — Windows Event Log Investigation](19-windows-event-log-investigation/) | Windows telemetry correlation |
| [27 — Vulnerability Management / Triage](27-vulnerability-management-triage/) | validation and remediation prioritization |
| [30 — SOC Shift Challenge](30-soc-shift-challenge/) | alert triage, escalation, handoff |
| [35 — Purple-Team Operator Challenge](35-purple-team-operator-challenge/) | detection validation against controlled actions |

Related main-track material:

- [Intermediate Log Analysis](../intermediate/08-log-analysis/)
- [Advanced Network Analysis](../advanced/05-advanced-network-analysis/)
- [Advanced Threat Hunting](../advanced/06-threat-hunting/)
- [Advanced Detection Engineering](../advanced/07-detection-engineering/)
- [Advanced Red vs. Blue Capstone](../advanced/11-red-vs-blue-capstone/)

---

## DFIR / Incident Response

Good choices for members interested in evidence preservation, timelines, host/network artifacts, and incident reconstruction.

| Lab | Main Practice |
|---|---|
| [01 — Linux Incident Investigation](01-linux-incident-investigation/) | filesystem and log evidence |
| [04 — Packet Investigation](04-packet-investigation/) | network forensics |
| [05 — Authentication Incident](05-authentication-incident/) | identity and access timeline |
| [11 — Full Incident Response Case](11-full-incident-response-case/) | complete incident reconstruction |
| [17 — Email / Phishing Forensics](17-email-phishing-forensics/) | raw-message and delivery-path analysis |
| [18 — Memory Forensics Foundations](18-memory-forensics-foundations/) | Volatility-style memory evidence |
| [19 — Windows Event Log Investigation](19-windows-event-log-investigation/) | Windows forensic telemetry |
| [30 — SOC Shift Challenge](30-soc-shift-challenge/) | multi-alert triage and investigation |

Related main-track material:

- [Beginner Digital Forensics](../beginner/09-intro-to-digital-forensics/)
- [Intermediate Packet Analysis](../intermediate/07-packet-analysis/)
- [Intermediate Log Analysis](../intermediate/08-log-analysis/)
- [Advanced Malware Analysis](../advanced/04-malware-analysis/)

---

## Reverse Engineering / Binary Analysis

Good choices for members interested in binaries, debugging, and low-level analysis.

| Lab | Main Practice |
|---|---|
| [07 — Reverse Engineering Drill](07-reverse-engineering-drill/) | stripped ELF analysis and debugging |

Related main-track material:

- [Intermediate Intro to Reverse Engineering](../intermediate/11-intro-to-reverse-engineering/)
- [Advanced Binary Analysis Foundations](../advanced/02-binary-analysis-foundations/)
- [Advanced Malware Analysis](../advanced/04-malware-analysis/)
- [Advanced Exploit Development Foundations](../advanced/10-exploit-development/)

More dedicated reversing labs are planned in the expansion roadmap.

---

## Cloud / Container / DevSecOps

Good choices for members interested in platform security, identity, pipelines, and hardening.

| Lab | Main Practice |
|---|---|
| [06 — Container Security Audit](06-container-security-audit/) | image/runtime/container hardening |
| [10 — Cloud / IAM Review](10-cloud-iam-review/) | cloud IAM, storage, and network review |
| [13 — DevSecOps Pipeline Review](13-devsecops-pipeline-review/) | CI/CD and supply-chain security |

Related main-track material:

- [Advanced Cloud Security](../advanced/08-cloud-security/)
- [Advanced Container Security](../advanced/09-container-security/)

---

## Network / Wireless

Good choices for members who want deeper network-analysis and service-enumeration practice.

| Lab | Main Practice |
|---|---|
| [02 — Network Service Triage](02-network-service-triage/) | service enumeration |
| [04 — Packet Investigation](04-packet-investigation/) | packet investigation |
| [14 — Multi-Host Cyber Range Investigation](14-multi-host-cyber-range/) | multi-host network mapping |
| [15 — Wireless Security Analysis](15-wireless-security-analysis/) | synthetic 802.11 analysis |
| [16 — Internal Network Penetration Test](16-internal-network-penetration-test/) | isolated subnet assessment |
| [28 — Pivoting and Lateral Movement Range](28-pivoting-lateral-movement-range/) | segmented network path analysis |
| [29 — Red-Team Assessment Capstone](29-red-team-assessment-capstone/) | multi-host assessment |

---

## Cross-Domain / Capstone-Style Practice

Use these when you want a scenario that combines multiple skills.

| Lab | Main Practice |
|---|---|
| [08 — Purple-Team Mini Range](08-purple-team-mini-range/) | web + logs + detection |
| [11 — Full Incident Response Case](11-full-incident-response-case/) | identity + endpoint + network + app |
| [14 — Multi-Host Cyber Range Investigation](14-multi-host-cyber-range/) | network + services + evidence |
| [16 — Internal Network Penetration Test](16-internal-network-penetration-test/) | enumeration + web + attack path + reporting |
| [29 — Red-Team Assessment Capstone](29-red-team-assessment-capstone/) | discovery + attack path + reporting |
| [30 — SOC Shift Challenge](30-soc-shift-challenge/) | triage + correlation + handoff |
| [35 — Purple-Team Operator Challenge](35-purple-team-operator-challenge/) | emulation + telemetry + detection + remediation |

---

# Choosing a Lab by Difficulty

## Beginner → Intermediate

These are useful when you want additional guided repetition before or early in Intermediate:

- [01 — Linux Incident Investigation](01-linux-incident-investigation/)

## Intermediate

These expect more independent tool use:

- [02 — Network Service Triage](02-network-service-triage/)
- [03 — Web Application Mapping](03-web-application-mapping/)

## Intermediate → Advanced

These are good bridges into more independent investigation:

- [04 — Packet Investigation](04-packet-investigation/)
- [05 — Authentication Incident](05-authentication-incident/)
- [07 — Reverse Engineering Drill](07-reverse-engineering-drill/)
- [15 — Wireless Security Analysis](15-wireless-security-analysis/)
- [16 — Internal Network Penetration Test](16-internal-network-penetration-test/)
- [17 — Email / Phishing Forensics](17-email-phishing-forensics/)
- [19 — Windows Event Log Investigation](19-windows-event-log-investigation/)
- [25 — Credential Attack Lab](25-credential-attack-lab/)
- [27 — Vulnerability Management / Triage](27-vulnerability-management-triage/)
- [31 — File Upload Security Challenge](31-file-upload-security-challenge/)
- [32 — Path Traversal / LFI Investigation](32-path-traversal-lfi-investigation/)

## Advanced

These expect stronger methodology, evidence reasoning, and independence:

- [06 — Container Security Audit](06-container-security-audit/)
- [08 — Purple-Team Mini Range](08-purple-team-mini-range/)
- [09 — SIEM / Detection Investigation](09-siem-detection-investigation/)
- [10 — Cloud / IAM Review](10-cloud-iam-review/)
- [11 — Full Incident Response Case](11-full-incident-response-case/)
- [12 — Active Directory Relationship Analysis](12-active-directory-relationship-analysis/)
- [13 — DevSecOps Pipeline Review](13-devsecops-pipeline-review/)
- [14 — Multi-Host Cyber Range Investigation](14-multi-host-cyber-range/)
- [18 — Memory Forensics Foundations](18-memory-forensics-foundations/)
- [20 — Linux Privilege Escalation Challenge](20-linux-privilege-escalation-challenge/)
- [21 — Windows Privilege Escalation Challenge](21-windows-privilege-escalation-challenge/)
- [22 — API Exploitation Lab](22-api-exploitation-lab/)
- [23 — SSRF and Internal Service Discovery](23-ssrf-internal-service-discovery/)
- [24 — Web Exploitation Chain](24-web-exploitation-chain/)
- [26 — Active Directory Red-Team Range](26-active-directory-red-team-range/)
- [28 — Pivoting and Lateral Movement Range](28-pivoting-lateral-movement-range/)
- [29 — Red-Team Assessment Capstone](29-red-team-assessment-capstone/)
- [30 — SOC Shift Challenge](30-soc-shift-challenge/)
- [33 — Command Injection Lab](33-command-injection-lab/)
- [34 — SQL Injection Deep Dive](34-sql-injection-deep-dive/)
- [35 — Purple-Team Operator Challenge](35-purple-team-operator-challenge/)

---

# Evidence Requirements

Unless a lab says otherwise, submit:

~~~text
1. Scope
2. Question being investigated
3. Commands/tools used
4. Important output
5. Observations
6. Interpretation
7. What is still uncertain
8. Remediation or next step
~~~

Screenshots can support an answer, but screenshots without explanation are not a complete submission.

---

# Infrastructure Rules

All Extra Practice infrastructure must be:

- local,
- synthetic,
- intentionally provided,
- bound to localhost or a dedicated training subnet where practical,
- easy to start and reset,
- clearly scoped,
- safe to destroy and recreate.

Do not redirect these exercises toward university systems, public systems, unrelated devices, or real accounts.

---

# Docker

Several Extra Practice labs use Docker.

If Docker is not installed or working in Kali, follow:

[../resources/DOCKER_SETUP.md](../resources/DOCKER_SETUP.md)

---

# Flags

Flags use:

~~~text
SRU{...}
~~~

Filled-in values are **not stored in this repository**.

Flag-bearing labs use runtime values supplied by the private instructor repository when required.

See:

[../resources/FLAG_PRIVACY.md](../resources/FLAG_PRIVACY.md)

---

# Resetting Labs

Always use the lab-specific cleanup instructions.

For script-based labs this may be:

~~~bash
./reset.sh
~~~

For Docker labs:

~~~bash
docker compose down
~~~

Do not run broad destructive cleanup commands against your entire environment unless you understand exactly what they will remove.

---

# Navigation

- [CyberLabs Home](../README.md)
- [Curriculum Index](../CURRICULUM_INDEX.md)
- [Beginner Track](../beginner/README.md)
- [Intermediate Track](../intermediate/README.md)
- [Advanced Track](../advanced/README.md)
- [Resources](../resources/README.md)
- [Extra Practice Expansion Roadmap](EXPANSION_ROADMAP.md)
