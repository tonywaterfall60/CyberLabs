# CyberLabs

Hands-on cybersecurity curriculum for the **SRU Cyber Club**.

CyberLabs is organized into four student-facing areas:

- **Beginner** — guided foundations and first technical labs
- **Intermediate** — structured analysis, enumeration, automation, and multi-step problem solving
- **Advanced** — independent investigation, controlled exploitation, enterprise/security engineering, and red/blue work
- **Extra Practice** — optional self-contained labs for repetition, specialization, and independent practice

---

## Start Here

### New to CyberLabs?

Start with:

[Beginner Track](beginner/README.md)

### Finished Beginner?

Continue with:

[Intermediate Track](intermediate/README.md)

### Ready for independent advanced work?

Continue with:

[Advanced Track](advanced/README.md)

### Want optional practice?

Browse:

[Extra Practice](Extra%20Practice/README.md)

### Want to see every current lab in one place?

Use:

[Curriculum Index](CURRICULUM_INDEX.md)

### Need setup help or references?

Use:

[Resources](resources/README.md)

---

## Quick Start

CyberLabs is designed primarily around a Kali Linux VM.

Clone once:

~~~bash
git clone https://github.com/tonywaterfall60/CyberLabs.git
cd CyberLabs
~~~

Before a club event:

~~~bash
git pull
~~~

Then enter the assigned event and read its README:

~~~bash
cd beginner/06-intro-to-nmap
cat README.md
~~~

For Docker-based labs, complete the setup guide first:

[Docker Setup](resources/DOCKER_SETUP.md)

---

## Repository Map

~~~text
CyberLabs/
├── README.md
├── CURRICULUM_INDEX.md
├── ROADMAP.md
├── CONTRIBUTING.md
├── SECURITY.md
│
├── beginner/
│   ├── README.md
│   ├── CHALLENGES.md
│   └── events...
│
├── intermediate/
│   ├── README.md
│   ├── CHALLENGES.md
│   └── events...
│
├── advanced/
│   ├── README.md
│   └── events...
│
├── Extra Practice/
│   ├── README.md
│   ├── EXPANSION_ROADMAP.md
│   └── labs...
│
├── resources/
│   ├── README.md
│   └── guides...
│
├── setup/
└── templates/
~~~

---

## Track Progression

~~~text
Beginner
   ↓
Intermediate
   ↓
Advanced
~~~

Extra Practice can be used at any stage when the lab difficulty is appropriate.

### Beginner

Members are generally given:

- more explanation,
- guided tool usage,
- smaller evidence sets,
- explicit workflows,
- stronger hints.

### Intermediate

Members are increasingly expected to:

- choose tools for a reason,
- validate automated output,
- correlate evidence,
- explain impact and remediation,
- work with less prompting.

### Advanced

Members should be able to:

- define the question or hypothesis,
- select appropriate evidence sources,
- work independently,
- distinguish observation from inference,
- state uncertainty,
- propose remediation and detection,
- stop when evidence or authorization runs out.

---

## Standard Lab Workflow

Not every event uses exactly the same files, but most challenges follow one of these patterns.

### Script-based lab

~~~bash
cd <event>/challenge
cat README.md
./setup.sh
~~~

When finished:

~~~bash
./reset.sh
~~~

if the lab provides a reset script.

### Docker-based lab

~~~bash
cd <event>/challenge
cat README.md
docker compose up --build -d
docker compose ps
~~~

When finished:

~~~bash
docker compose down
~~~

Always use the lab-specific instructions when they differ.

---

## Core Resources

| Need | Guide |
|---|---|
| Docker installation and troubleshooting | [Docker Setup](resources/DOCKER_SETUP.md) |
| Kali tools used across CyberLabs | [Kali Tools](resources/KALI_TOOLS.md) |
| Flag handling and privacy | [Flag Privacy](resources/FLAG_PRIVACY.md) |
| Web-lab design standard | [Web Lab Standard](resources/WEB_LAB_STANDARD.md) |
| Basic command reference | [Command Cheatsheet](resources/command-cheatsheet.md) |

See [resources/README.md](resources/README.md) for the organized resource index.

---

## Challenge Flags

Challenge flags use:

~~~text
SRU{...}
~~~

Filled-in values are **not stored in this student repository**.

Private event values live only in the private instructor repository and are supplied at runtime when a lab requires them.

See:

[Challenge Flag Privacy](resources/FLAG_PRIVACY.md)

---

## Learning Philosophy

CyberLabs follows several principles:

1. **Understand before automate.** Know what a tool is doing before relying on it.
2. **Evidence before conclusions.** Support findings with observable evidence.
3. **Scope before testing.** Verify authorization before scanning or testing.
4. **Attack and defense together.** Offensive findings should include mitigation and detection thinking.
5. **Progressive difficulty.** Later events build on earlier skills.
6. **Reproducible labs.** Challenges should be easy to start, reset, and repeat.
7. **State uncertainty.** A strong answer can say when available evidence is insufficient.

---

## Safety and Authorization

Only perform security testing against:

- systems you personally own,
- systems intentionally provided by CyberLabs,
- local CyberLabs containers/VMs/ranges, or
- systems for which you have explicit authorization.

Do **not** redirect CyberLabs exercises toward:

- university production infrastructure,
- public Internet systems,
- other students' devices,
- third-party websites,
- unrelated wireless networks,
- real accounts or credentials.

A challenge-defined host, subnet, port range, file set, or application is part of the authorized scope.

See:

[SECURITY.md](SECURITY.md)

---

## Current Curriculum vs. Future Plans

For current events and labs:

[CURRICULUM_INDEX.md](CURRICULUM_INDEX.md)

For future E-board development and planned features:

[ROADMAP.md](ROADMAP.md)

For Extra Practice expansion specifically:

[Extra Practice Expansion Roadmap](Extra%20Practice/EXPANSION_ROADMAP.md)

---

## Contributing

Club members and E-board members are encouraged to improve labs and documentation.

Before contributing, read:

[CONTRIBUTING.md](CONTRIBUTING.md)
