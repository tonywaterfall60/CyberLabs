# Beginner Challenge Index

All Beginner challenges are stored directly in GitHub with their event.

## One-Time Setup

```bash
git clone https://github.com/tonywaterfall60/CyberLabs.git
cd CyberLabs
```

Before each event:

```bash
git pull
```

## Challenge Locations

| Event | Challenge Path | Setup |
|---|---|---|
| Intro to Cybersecurity | `beginner/01-intro-to-cybersecurity/challenge` | none |
| Linux Basics | `beginner/02-linux-basics/challenge` | `./setup.sh` |
| Networking | `beginner/03-networking-fundamentals/challenge` | none |
| Command Line | `beginner/04-command-line-workshop/challenge` | `./setup.sh` |
| Wireshark | `beginner/05-intro-to-wireshark/challenge` | `docker compose up -d` |
| Nmap | `beginner/06-intro-to-nmap/challenge` | `docker compose up -d` |
| Web Security | `beginner/07-web-security-basics/challenge` | `docker compose up --build -d` |
| Cryptography | `beginner/08-intro-to-cryptography/challenge` | `./setup.sh` |
| Digital Forensics | `beginner/09-intro-to-digital-forensics/challenge` | `./setup.sh` |
| Beginner CTF | `beginner/10-beginner-ctf` | `./setup.sh && docker compose up -d` |

## Recommended Student Workflow

Example:

```bash
git pull
cd beginner/06-intro-to-nmap/challenge
cat README.md
docker compose up -d
```

When finished:

```bash
docker compose down
```

This design means the E-board does not need to email challenge files or manually copy them to each member.
