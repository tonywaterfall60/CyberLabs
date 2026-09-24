# Advanced Challenge Index

Advanced labs assume completion of the Intermediate track and a Kali Linux VM.

## Workflow

Clone/update:

~~~bash
git pull
~~~

Read the event README before starting the challenge.

## Challenges

| # | Event | Challenge | Main Tools | Startup |
|---:|---|---|---|---|
| 01 | Advanced Web Security | `advanced/01-advanced-web-security/challenge` | Burp, curl, ffuf | `docker compose up --build -d` |
| 02 | Binary Analysis | `advanced/02-binary-analysis-foundations/challenge` | GDB, checksec, objdump | `./build.sh` |
| 03 | Active Directory Security | `advanced/03-active-directory-security/challenge` | grep, awk, Python | none |
| 04 | Malware Analysis | `advanced/04-malware-analysis/challenge` | strings, YARA, strace/ltrace | `./build.sh` |
| 05 | Advanced Network Analysis | `advanced/05-advanced-network-analysis/challenge` | Wireshark, tshark, Scapy | `python3 generate_pcap.py` |
| 06 | Threat Hunting | `advanced/06-threat-hunting/challenge` | jq, grep, Python | none |
| 07 | Detection Engineering | `advanced/07-detection-engineering/challenge` | YAML, jq, Python | none |
| 08 | Cloud Security | `advanced/08-cloud-security/challenge` | jq, Python | none |
| 09 | Container Security | `advanced/09-container-security/challenge` | Docker, optional Trivy | static review / safe image build |
| 10 | Exploit Development | `advanced/10-exploit-development/challenge` | GDB, pwntools, checksec | `./build.sh` |
| 11 | Red vs. Blue Capstone | `advanced/11-red-vs-blue-capstone` | Burp, jq/Python | `docker compose up --build -d` |

## Scope

Every target is local, synthetic, or intentionally provided.

Do not reuse challenge workflows against unrelated systems.

## Flag Privacy

No filled-in flags belong in this repository.

Flag-enabled challenges use instructor-supplied runtime environment variables.

See:

[../resources/FLAG_PRIVACY.md](../resources/FLAG_PRIVACY.md)

## Infrastructure Notes

These labs work locally now:

- web security
- binary analysis
- benign malware analysis
- synthetic packet analysis
- threat hunting
- detection engineering
- cloud configuration review
- container review
- exploit-development toy binary

These should later receive shared-range upgrades:

- Active Directory Security
- enterprise logging/SIEM
- Red vs. Blue Capstone
