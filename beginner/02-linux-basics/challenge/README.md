# Challenge — Linux Incident File Hunt

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Beginner |
| Estimated time | 35–50 minutes |
| Environment | Kali / Linux terminal |
| Authorized scope | Generated training directory and local system-context commands |
| Goal | Locate and document evidence using basic Linux commands |
## Scenario

You are given a small training directory from a fictional Linux system after a suspicious login report.

Your job is to navigate the filesystem and locate evidence using basic Linux commands.

The setup creates:

~~~text
~/cyberclub/linux-challenge/
├── logs/
├── archive/
├── docs/
└── hidden files
~~~

## Authorized Scope

Primary challenge data is limited to:

~~~text
~/cyberclub/linux-challenge/
~~~

The system-context commands in Phase 5 may inspect your own Kali VM only. Do not search unrelated files or systems.

## Setup

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/linux-challenge
~~~

## Rules

- Use terminal commands only.
- Do not use a graphical file browser.
- Record the command you used for each task.
- If a command gives too much output, refine it rather than manually scrolling forever.

## Objectives / Tasks

### Phase 1 — Orientation

1. Print your current directory.
2. List normal files and directories.
3. List all files including hidden files.
4. Identify which subdirectories exist.

Suggested command families:

~~~text
pwd
ls
ls -la
~~~

### Phase 2 — Log Search

1. Find which file contains `FAILED_LOGIN`.
2. Display only the failed-login lines.
3. Count the failed-login entries.
4. Identify the username involved.
5. Identify the source IP involved.

Try to answer using `grep` rather than opening every file manually.

### Phase 3 — Hidden Evidence

1. Find the hidden file in the challenge root.
2. Display its contents.
3. Explain what the leading dot means on Linux.
4. Record the flag stored with the hidden analyst note.

### Phase 4 — File Search

1. Search the challenge tree for files containing the primary evidence flag.
2. Identify the full path.
3. Display the file contents.
4. Identify who owns the file.
5. Record the flag.

Useful commands may include:

~~~bash
find . -type f
grep -R "FLAG" .
ls -l <file>
~~~

### Phase 5 — System Context

Identify:

~~~text
Current username:
User ID / groups:
One network interface:
One IP address:
Default route if present:
~~~

Useful commands:

~~~bash
whoami
id
ip addr
ip route
~~~

### Phase 6 — Evidence Summary

Complete:

~~~text
Suspicious user:
Source IP:
Failed-login count:
Hidden-file clue:
Flag/evidence path:
Current Linux user:
Local IP:
~~~


## Deliverable

Submit the command used for each answer—not only the final value—and submit both discovered flags to the CyberLabs dashboard.

## Cleanup

~~~bash
./reset.sh
~~~