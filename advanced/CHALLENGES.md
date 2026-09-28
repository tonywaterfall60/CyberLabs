# Advanced Challenge Index

This page lists the hands-on challenge location and startup method for each Advanced event.

Advanced labs assume strong familiarity with the Intermediate track and a Kali Linux VM.

For the full Advanced curriculum, see:

[README.md](README.md)

---

## Standard Workflow

Before each event:

~~~bash
git pull
~~~

Then:

1. read the event README,
2. identify the authorized scope,
3. define the question or hypothesis,
4. start or generate the challenge,
5. collect and validate evidence,
6. clean up using the event instructions.

---

## Challenges

| # | Event | Challenge Path | Main Tools / Evidence | Startup |
|---:|---|---|---|---|
| 01 | Advanced Web Security | `advanced/01-advanced-web-security/challenge` | Burp, curl, structured telemetry | `docker compose up --build -d` |
| 02 | Binary Analysis Foundations | `advanced/02-binary-analysis-foundations/challenge` | GDB, checksec, objdump | `./build.sh` |
| 03 | Active Directory Security | `advanced/03-active-directory-security/challenge` | CSV graph evidence, Python/grep | none |
| 04 | Malware Analysis | `advanced/04-malware-analysis/challenge` | strings, YARA, strace/ltrace | `./build.sh` |
| 05 | Advanced Network Analysis | `advanced/05-advanced-network-analysis/challenge` | Wireshark, tshark, Scapy | `python3 generate_pcap.py` |
| 06 | Threat Hunting | `advanced/06-threat-hunting/challenge` | JSONL telemetry, jq, Python | none |
| 07 | Detection Engineering | `advanced/07-detection-engineering/challenge` | YAML, JSONL, Python tests | `python3 test_detections.py` |
| 08 | Cloud Security | `advanced/08-cloud-security/challenge` | JSON cloud evidence, jq | none |
| 09 | Container Security | `advanced/09-container-security/challenge` | Dockerfile/Compose/image review | static review / safe image build |
| 10 | Exploit Development Foundations | `advanced/10-exploit-development/challenge` | GDB, pwntools, checksec | `./build.sh` |
| 11 | Red vs. Blue Capstone | `advanced/11-red-vs-blue-capstone` | Burp, JSON logs, Python detector | `docker compose up --build -d` |
| 12 | API Exploitation & Authorization Testing | `advanced/12-api-exploitation-authorization-testing/challenge` | API transcript | none |
| 13 | Advanced AD / Identity Attack Paths | `advanced/13-advanced-ad-identity-attack-paths/challenge` | relationship CSV | none |
| 14 | Web Exploitation Chaining | `advanced/14-web-exploitation-chaining/challenge` | web finding chain | none |
| 15 | SSRF & Internal Trust Boundaries | `advanced/15-ssrf-internal-trust-boundaries/challenge` | architecture + requests | none |
| 16 | Pivoting & Segmented Networks | `advanced/16-pivoting-segmented-networks/challenge` | routing/reachability evidence | none |
| 17 | Advanced Windows Internals | `advanced/17-advanced-windows-internals/challenge` | process/token/service evidence | none |
| 18 | Memory Forensics Training Image | `advanced/18-memory-forensics-training-image/challenge` | Volatility-style evidence | none |
| 19 | Reverse Engineering II | `advanced/19-reverse-engineering-ii/challenge` | disassembly + strings | none |
| 20 | Exploit Mitigations Deep Dive | `advanced/20-exploit-mitigations-deep-dive/challenge` | mitigation comparison | none |
| 21 | Threat Emulation & Detection Validation | `advanced/21-threat-emulation-detection-validation/challenge` | emulation JSONL | none |
| 22 | SIEM Engineering | `advanced/22-siem-engineering/challenge` | JSONL/CSV schemas | none |
| 23 | Advanced Cloud Identity | `advanced/23-advanced-cloud-identity/challenge` | identity/trust/audit JSON | none |
| 24 | Kubernetes Security | `advanced/24-kubernetes-security/challenge` | Kubernetes YAML | none |
| 25 | DevSecOps / Supply Chain II | `advanced/25-devsecops-supply-chain-ii/challenge` | workflow/SBOM/provenance | none |
| 26 | Incident Command / Major Incident Response | `advanced/26-incident-command-major-incident-response/challenge` | timeline/status/roles | none |
| 27 | Professional Penetration-Test Reporting | `advanced/27-professional-pentest-reporting/challenge` | raw findings + business context | none |
| 28 | Threat Modeling / Architecture Review | `advanced/28-threat-modeling-architecture-review/challenge` | architecture/data flows | none |

---

## Cleanup

Advanced labs have different cleanup requirements.

Use the event README as the source of truth.

Examples:

~~~bash
docker compose down
~~~

or removing generated PCAPs, trace files, or local binaries as directed by the event.

---

## Scope

Every target is local, synthetic, or intentionally provided.

Do not reuse Advanced challenge workflows against unrelated systems or infrastructure.

---

## Flag Privacy

No filled-in flags belong in this repository.

Flag-enabled challenges use instructor-supplied runtime environment variables.

See:

[../resources/FLAG_PRIVACY.md](../resources/FLAG_PRIVACY.md)

---

## Infrastructure Notes

Most Advanced labs are currently designed to run with:

- local containers,
- fictional exported datasets,
- synthetic telemetry,
- synthetic PCAPs,
- benign compiled samples,
- toy vulnerable binaries.

Shared-range upgrades are tracked separately in:

[../ROADMAP.md](../ROADMAP.md)

---

## Navigation

- [Advanced Track](README.md)
- [Curriculum Index](../CURRICULUM_INDEX.md)
- [Resources](../resources/README.md)
- [Extra Practice](../Extra%20Practice/README.md)
