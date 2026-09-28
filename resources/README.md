# CyberLabs Resources

Shared setup guides, standards, and references used across the Beginner, Intermediate, Advanced, and Extra Practice labs.

Use this directory when you need environment help or a reference that applies to more than one event.

---

## Environment Setup

### Docker Setup

[DOCKER_SETUP.md](DOCKER_SETUP.md)

Use this for:

- installing Docker on Kali,
- Docker Compose setup,
- permission errors,
- daemon troubleshooting,
- port conflicts,
- container cleanup,
- standard CyberLabs Docker workflow.

### Kali Tools

[KALI_TOOLS.md](KALI_TOOLS.md)

Use this for:

- common tools used in CyberLabs,
- where tools appear in the curriculum,
- what members are expected to understand about each tool.

---

## Lab Standards

### Flag Privacy

[FLAG_PRIVACY.md](FLAG_PRIVACY.md)

Defines:

- the SRU flag format,
- why real flags are not committed,
- runtime flag injection,
- limitations of private flags in student-owned local environments.

### Web Lab Standard

[WEB_LAB_STANDARD.md](WEB_LAB_STANDARD.md)

Defines the common student-facing design for CyberLabs web applications, including:

- visual consistency,
- training banners,
- route conventions,
- challenge headers,
- difficulty progression,
- flag handling.

---

## Quick References

### Command Cheatsheet

[command-cheatsheet.md](command-cheatsheet.md)

Small reference for:

- Linux commands,
- networking commands,
- basic Git commands.

---

## Where to Start

| Situation | Resource |
|---|---|
| Docker will not start | [Docker Setup](DOCKER_SETUP.md) |
| Docker socket permission denied | [Docker Setup](DOCKER_SETUP.md) |
| Unsure what a Kali tool is for | [Kali Tools](KALI_TOOLS.md) |
| Building or reviewing a flag-bearing lab | [Flag Privacy](FLAG_PRIVACY.md) |
| Building a CyberLabs web challenge | [Web Lab Standard](WEB_LAB_STANDARD.md) |
| Need a few common shell commands | [Command Cheatsheet](command-cheatsheet.md) |

---

## Resource Design Rule

Files belong in resources when they are useful across **multiple** labs or tracks.

Event-specific instructions should stay with the event itself.
