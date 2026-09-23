# Contributing to CyberLabs

Contributions are welcome from club members, E-board members, alumni, faculty advisers, and approved event leads.

CyberLabs should remain:

- beginner-friendly where appropriate,
- technically accurate,
- reproducible,
- safe to run in a student lab,
- clearly scoped,
- easy for future E-board members to maintain.

---

## Ways to Contribute

You can contribute:

- new labs
- challenge ideas
- bug fixes
- clearer instructions
- Kali tool integrations
- Docker environments
- PCAPs generated from authorized lab traffic
- scripts
- diagrams
- cheatsheets
- accessibility improvements
- typo/documentation fixes

---

## Before Creating a New Event

Check the existing curriculum to determine:

1. Which track it belongs in.
2. What prerequisite knowledge it assumes.
3. Which earlier event it builds on.
4. What skill members should leave with.
5. Whether the lab can be reset easily.

A new event should not simply be "here is a cool tool." The tool should support a learning objective.

---

## Standard Event Structure

Use this format:

```text
event-name/
├── README.md
└── challenge/
    ├── README.md
    ├── setup.sh          # when appropriate
    ├── reset.sh          # when appropriate
    ├── docker-compose.yml
    └── challenge files
```

Use:

```text
templates/LAB_TEMPLATE.md
```

as a starting point.

---

## Event README Requirements

Each event README should include:

### Event Information

- title
- difficulty
- estimated time
- prerequisites
- environment/tools

### Why This Event Exists

Explain how the topic fits into the curriculum.

### Learning Objectives

Use observable outcomes.

Good:

> Identify HTTP request methods and status codes using Burp Suite.

Less useful:

> Learn about web security.

### Concepts

Explain enough theory that a member can understand what the lab demonstrates.

### Guided Lab

Include commands and expected workflow.

### Challenge

Point directly to the challenge directory.

### Deliverable

Explain what members should produce or explain.

### Cleanup

Every environment must have clear cleanup/reset instructions.

### Next Event

Link to the next recommended event.

---

## Challenge Requirements

A challenge should be reproducible from a fresh clone.

Preferred startup styles:

### Script

```bash
./setup.sh
```

### Docker

```bash
docker compose up -d
```

Avoid requiring event leads to manually distribute hidden files unless absolutely necessary.

---

## Kali Tool Integration

When appropriate, use tools members already have in Kali.

Examples:

- Nmap
- Burp Suite
- Gobuster
- ffuf
- curl
- Netcat
- Wireshark
- tcpdump
- tshark
- hashid
- hashcat
- John the Ripper
- GDB
- radare2
- Ghidra
- Python

Do not add a tool merely to make a challenge look more advanced.

The README must explain:

- what the tool is being used for,
- why it is appropriate,
- what output members should focus on.

---

## Flag Format

If a challenge uses a flag, use:

```text
SRU{}
```

The E-board or instructor can later fill in the text between the braces.

Do not use alternate flag prefixes.

---

## Safety Requirements

All offensive or dual-use activities must be restricted to:

- local challenge files,
- local containers,
- intentionally vulnerable club VMs,
- or other explicitly authorized systems.

Do not create labs that instruct members to scan or exploit random public targets.

Do not include:

- real passwords
- real API tokens
- private keys
- student personal information
- unauthorized data
- real production credentials

---

## Vulnerable Applications

If a challenge intentionally contains a vulnerable service:

- bind it to localhost when practical,
- clearly label it as intentionally vulnerable,
- define the permitted scope,
- provide cleanup instructions,
- avoid exposing it directly to the Internet.

Example:

```yaml
ports:
  - "127.0.0.1:8200:5000"
```

---

## Pull Request Workflow

Create a branch:

```bash
git checkout -b add-intermediate-example
```

Make changes.

Check:

```bash
git status
git diff
```

Commit:

```bash
git add .
git commit -m "Add intermediate example lab"
```

Push and open a pull request.

---

## Pull Request Checklist

Before submitting:

- [ ] Event fits the correct skill level
- [ ] Prerequisites are listed
- [ ] Learning objectives are clear
- [ ] Commands were tested
- [ ] Setup works from a fresh clone
- [ ] Cleanup/reset works
- [ ] Docker targets bind locally where appropriate
- [ ] Scope is explicitly documented
- [ ] No real secrets are included
- [ ] Flag format is `SRU{}`
- [ ] Instructor answers are not exposed
- [ ] Challenge files do not depend on undocumented resources
- [ ] Markdown links work
- [ ] The event points to the next recommended topic

---

## Instructor Material

Solutions, scoring rubrics, interview keys, and private flags belong in the separate private instructor repository.

They should not be committed here.

---

## Questions

If you are unsure where a contribution belongs, open an issue describing the proposed lab before building the full challenge.
