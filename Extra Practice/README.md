# Extra Practice

Additional hands-on CyberLabs exercises for members who want more repetition outside the main Beginner, Intermediate, and Advanced event tracks.

## Purpose

The main tracks introduce concepts in a planned sequence.

**Extra Practice** is different:

- labs are self-contained,
- scenarios are more realistic,
- students receive fewer hints,
- infrastructure is more complete,
- evidence collection is required,
- several labs combine skills from multiple events,
- labs can be repeated independently.

These exercises are not required for track advancement unless an event lead says otherwise.

---

## Recommended Workflow

From the CyberLabs repository:

~~~bash
git pull
cd "Extra Practice"
~~~

Choose a lab and read its README before starting anything.

Example:

~~~bash
cd 01-linux-incident-investigation
cat README.md
~~~

---

## Lab Catalog

| # | Lab | Difficulty | Main Skills | Infrastructure |
|---:|---|---|---|---|
| 01 | Linux Incident Investigation | Beginner → Intermediate | Linux, grep, find, logs, evidence handling | local generated filesystem |
| 02 | Network Service Triage | Intermediate | Nmap, curl, Netcat, service prioritization | 3 local Docker services |
| 03 | Web Application Mapping | Intermediate | Burp, curl, ffuf/Gobuster, route mapping | local Flask app |
| 04 | Packet Investigation | Planned | Wireshark, tshark, timelines | generated PCAP |
| 05 | Authentication Incident | Planned | log correlation, Python | synthetic logs |
| 06 | Container Audit | Planned | Dockerfile/Compose review | local image/config |
| 07 | Reverse Engineering Drill | Planned | GDB, radare2, strings | local binary |
| 08 | Purple-Team Mini Range | Planned | web + logs + detection | multi-container range |

More labs will be added in small batches.

---

## Difficulty

Extra Practice uses four informal labels:

~~~text
Beginner
Beginner → Intermediate
Intermediate
Advanced
~~~

The label describes how independently students are expected to work.

---

## Evidence Requirements

Unless the lab says otherwise, submit:

~~~text
1. Scope
2. Question being investigated
3. Commands/tools used
4. Important output
5. Observations
6. Interpretation
7. What is still uncertain
8. Remediation or next step
~~~

Screenshots are useful, but screenshots without explanation are not a complete submission.

---

## Infrastructure Rules

All Extra Practice infrastructure must be:

- local,
- synthetic,
- intentionally provided,
- bound to localhost where practical,
- easy to start and reset,
- clearly scoped,
- safe to destroy and recreate.

Do not redirect the exercises toward university systems, public systems, or unrelated devices.

---

## Docker

Several Extra Practice labs use Docker.

If Docker is not installed in your Kali VM, follow:

[../resources/DOCKER_SETUP.md](../resources/DOCKER_SETUP.md)

---

## Flags

Flags use:

~~~text
SRU{...}
~~~

Filled-in values are **not stored in this repository**.

Flag-bearing practice labs use runtime values supplied by the private instructor repository.

See:

[../resources/FLAG_PRIVACY.md](../resources/FLAG_PRIVACY.md)

---

## Resetting Labs

Always use the lab-specific cleanup instructions.

For script-based labs this may be:

~~~bash
./reset.sh
~~~

For Docker labs:

~~~bash
docker compose down
~~~

Do not use broad cleanup commands against your entire Docker environment unless you understand their effects.
