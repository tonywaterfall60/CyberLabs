# CyberLabs

Hands-on cybersecurity curriculum for the SRU Cyber Club.

The repository is organized by skill level. Each event includes learning objectives, prerequisites, guided practice, a hands-on challenge, deliverables, and cleanup instructions.

## Quick Start

Clone the repository once:

```bash
git clone https://github.com/tonywaterfall60/CyberLabs.git
cd CyberLabs
```

Before each club event:

```bash
git pull
```

Then enter the event or challenge folder listed by the event lead.

## Tracks

- [Beginner](beginner/) — foundations, Linux, networking, Wireshark, Nmap, web, crypto, and forensics
- [Intermediate](intermediate/) — enumeration, web testing, privilege escalation, packet/log analysis, scripting, and reverse engineering
- [Advanced](advanced/) — advanced web security, binary analysis, enterprise security, detection, and red/blue exercises

## Challenge Model

Challenges are stored with the event whenever possible.

Typical workflow:

```bash
cd beginner/06-intro-to-nmap/challenge
./setup.sh
cat README.md
```

Windows-friendly challenges also include PowerShell setup when it materially helps.

For Docker challenges:

```bash
docker compose up -d
```

Afterward, use the provided cleanup/reset command.

## Safety and Scope

Only perform security testing against:

- systems you own,
- systems intentionally provided by the club, or
- systems for which you have explicit authorization.

Do not scan, probe, exploit, or capture traffic from university production systems, public Internet systems, other students' devices, or third-party systems without authorization.

## Repository Roles

This repository is student-facing. Answer keys, CTF solutions, interview rubrics, and event-lead materials are kept separately in the private `CyberLabs-Instructor` repository.
