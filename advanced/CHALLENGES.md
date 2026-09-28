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
