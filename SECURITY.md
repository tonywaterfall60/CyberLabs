# CyberLabs Security Policy

CyberLabs contains intentionally security-focused training material, including local vulnerable services and dual-use cybersecurity tooling.

This file explains how challenge environments, sensitive data, and repository security issues should be handled.

---

## Authorized Use

CyberLabs exercises are intended only for:

- local challenge environments,
- member-owned systems,
- intentionally vulnerable club VMs,
- or systems with explicit testing authorization.

Challenge instructions do not grant permission to test unrelated infrastructure.

University systems, public websites, third-party networks, and other members' devices are out of scope unless explicit authorization is provided.

---

## Reporting a Repository Security Problem

If you discover a security issue in the repository itself, such as:

- exposed credentials,
- private keys,
- real API tokens,
- personal student information,
- an accidentally committed instructor solution,
- sensitive challenge infrastructure information,

do **not** post the sensitive value in a public issue.

Instead, notify the repository owner or Cyber Club E-board privately.

Include:

```text
Affected file:
Problem:
When discovered:
Potential exposure:
Recommended action:
```

Do not copy the sensitive value into additional files or messages unnecessarily.

---

## Secrets and Credentials

Never commit real:

- passwords
- API keys
- OAuth tokens
- VPN keys
- SSH private keys
- cloud credentials
- database credentials
- authentication cookies
- session tokens

Training credentials must be clearly fictional.

Examples:

```text
training-password
example-token
SRU{}
```

---

## Personal Information

Do not commit:

- student IDs
- private email addresses
- phone numbers
- home addresses
- private messages
- real account credentials
- personally identifying class records

Use fictional data for OSINT, log, phishing, and incident-response exercises unless approved sanitized data is specifically provided.

---

## Malware and Dangerous Files

Do not place live malware in the student-facing repository.

If malware analysis is added to the Advanced track, use one of the following:

- harmless simulation binaries,
- intentionally benign samples,
- instructor-controlled isolated resources,
- hashes/metadata/screenshots instead of live samples where possible.

Any future live-sample handling must be documented separately and tightly controlled.

---

## Vulnerable Services

Intentionally vulnerable or training services should:

1. run locally whenever possible,
2. bind to `127.0.0.1` when remote access is unnecessary,
3. use fictional credentials/data,
4. clearly define scope,
5. include shutdown/reset instructions.

Example:

```yaml
ports:
  - "127.0.0.1:8080:80"
```

Do not expose training applications directly to the public Internet.

---

## Docker Safety

Before starting a challenge:

```bash
docker compose config
```

After finishing:

```bash
docker compose down
```

If a lab stores state in volumes and a full reset is required:

```bash
docker compose down -v
```

Members should understand what a compose file does before running unfamiliar third-party configurations.

---

## Tool Scope

Tools such as:

- Nmap
- Burp Suite
- Gobuster
- ffuf
- Nikto
- Netcat
- hashcat
- John the Ripper
- Wireshark
- tcpdump

are legitimate security tools but can affect systems outside the lab if used carelessly.

Challenge documentation must specify the permitted target.

When a challenge says:

```text
127.0.0.1:8200
```

that target is the scope of the exercise.

---

## Flag Handling

Challenge flags use the format:

```text
SRU{...}
```

Filled-in flag values are private instructor material and must never be committed to this repository.

The private `CyberLabs-Instructor` repository stores challenge-specific values and event-lead injection instructions.

Student challenge code may contain runtime hooks such as:

```text
FLAG_VALUE
LINUX_FLAG_VALUE
REV_FLAG_VALUE
WEB_FLAG_VALUE
```

but those values are supplied only at event time.

Private files such as `.env`, `flags.env`, `flag.txt`, `.flag`, and `*.flag` are ignored by this repository.

---

## Dependency and Image Safety

Docker images and packages should preferably come from well-known upstream projects.

Challenge maintainers should periodically review:

- Docker image names
- package versions
- build dependencies
- scripts downloaded during setup

Avoid piping remote scripts directly into a shell in student instructions.

---

## Accidental Secret Exposure

If a real secret is committed:

1. treat the secret as compromised,
2. rotate or revoke it immediately,
3. remove it from the repository,
4. review commit history and logs as needed,
5. document what happened privately.

Deleting the file alone does not make an exposed secret safe.

---

## Security Questions

When in doubt, prefer fictional data, local environments, and narrower scope.
