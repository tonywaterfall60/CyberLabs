# CyberLabs

Hands-on cybersecurity curriculum for the **SRU Cyber Club**.

CyberLabs is designed as a practical learning environment where members progress from foundational cybersecurity concepts into structured enumeration, analysis, automation, reverse engineering, and advanced security exercises.

The repository is organized into three tracks:

- **Beginner** — core cybersecurity, Linux, networking, Wireshark, Nmap, web fundamentals, cryptography, and digital forensics
- **Intermediate** — enumeration, Burp Suite, OWASP concepts, password security, privilege-escalation analysis, packet/log analysis, OSINT, Python, and reverse engineering
- **Advanced** — advanced web security, binary analysis, enterprise environments, detection engineering, threat hunting, and red/blue exercises
- **Extra Practice** — optional self-contained labs for repetition, remediation, and open-lab practice

---

## Quick Start

CyberLabs is intended to be used from a Kali Linux VM whenever possible.

Clone the repository once:

```bash
git clone https://github.com/tonywaterfall60/CyberLabs.git
cd CyberLabs
```

Before each club event:

```bash
git pull
```

Then enter the event directory:

```bash
cd beginner/06-intro-to-nmap
cat README.md
```

or:

```bash
cd intermediate/02-web-enumeration/challenge
cat README.md
```

---

## Recommended Kali Environment

Most club exercises are designed around tools commonly available in Kali Linux.

Frequently used tools include:

| Area | Tools |
|---|---|
| Linux / CLI | bash, grep, find, awk, sed, cut |
| Networking | ip, ss, ping, dig, traceroute |
| Enumeration | Nmap, Netcat, curl |
| Web | Burp Suite, Gobuster, ffuf, Nikto, curl |
| Packet Analysis | Wireshark, tcpdump, tshark |
| Password Security | hashid, hashcat, John the Ripper |
| OSINT | dig, whois, metadata tools |
| Reverse Engineering | file, strings, readelf, objdump, GDB, radare2/Ghidra |
| Scripting | Python 3 |

Not every event uses every tool. The goal is to introduce tools when they support the learning objective.

For a track-by-track tool reference, see [resources/KALI_TOOLS.md](resources/KALI_TOOLS.md).

For optional independent practice, see [Extra Practice/README.md](Extra%20Practice/README.md).

Docker is not guaranteed to be installed in Kali. Before running Docker-based challenges, follow [resources/DOCKER_SETUP.md](resources/DOCKER_SETUP.md).

---

## Repository Structure

```text
CyberLabs/
├── beginner/
│   ├── README.md
│   ├── CHALLENGES.md
│   └── ...
│
├── intermediate/
│   ├── README.md
│   ├── CHALLENGES.md
│   └── ...
│
├── advanced/
│
├── Extra Practice/
│   ├── README.md
│   └── ...
│
├── setup/
│
├── resources/
│
├── templates/
│
├── CONTRIBUTING.md
├── ROADMAP.md
└── SECURITY.md
```

Each event normally follows:

```text
event/
├── README.md
└── challenge/
    ├── README.md
    ├── setup files
    ├── lab resources
    └── cleanup/reset files
```

---

## Challenge Workflow

Challenges are self-contained whenever possible.

### Script-based challenge

```bash
cd intermediate/08-log-analysis/challenge
./setup.sh
cat README.md
```

When finished:

```bash
./reset.sh
```

### Docker-based challenge

```bash
cd intermediate/02-web-enumeration/challenge
docker compose up --build -d
cat README.md
```

When finished:

```bash
docker compose down
```

---

## Flags

Challenge flags use the format:

```text
SRU{...}
```

Filled-in flag values are never stored in this student repository.

Private values live only in the private `CyberLabs-Instructor` repository and are injected by the event lead when a challenge requires a flag.

Student challenge code may reference runtime variables such as `FLAG_VALUE`, `LINUX_FLAG_VALUE`, `REV_FLAG_VALUE`, or `WEB_FLAG_VALUE`, but the real values are instructor-only.

If a private value is not injected, the challenge may show `FLAG_NOT_CONFIGURED` or use a non-flag success message.

---

## Learning Philosophy

CyberLabs follows several principles:

1. **Understand before automate.** Members should know what a tool is doing before relying on it.
2. **Evidence before conclusions.** Findings should be supported by observable evidence.
3. **Scope before testing.** Always verify authorization before scanning or testing.
4. **Attack and defense together.** Offensive concepts should include mitigation and detection discussion.
5. **Progressive difficulty.** Later events assume skills introduced earlier.
6. **Reproducible labs.** Challenges should be easy to start, reset, and repeat.

---

## Safety and Authorization

Only perform security testing against:

- systems you personally own,
- systems intentionally provided by CyberLabs,
- local challenge containers/VMs, or
- systems for which you have explicit authorization.

Do **not** scan, probe, intercept, exploit, or test:

- university production infrastructure,
- public Internet systems,
- other students' devices,
- third-party websites,
- unrelated wireless networks,
- real accounts or credentials,

unless explicit authorization has been provided.

When a challenge defines a target or port range, that scope is part of the exercise.

---

## Contributing

Club members and E-board members are encouraged to improve labs and documentation.

Before contributing, read:

[CONTRIBUTING.md](CONTRIBUTING.md)

---

## Curriculum Status

See:

[ROADMAP.md](ROADMAP.md)

for current development status and planned additions.

For responsible handling of secrets, challenge data, and security concerns, see:

[SECURITY.md](SECURITY.md)
