# Beginner 02 — Linux Basics

**Difficulty:** Beginner  
**Estimated time:** 75–90 minutes  
**Prerequisites:** Beginner 01  
**Environment:** Linux VM, WSL, or Linux workstation

## Why This Event Exists

Linux appears constantly in cybersecurity: servers, cloud systems, containers, CTFs, security tools, and appliances. Members should become comfortable working in a terminal before later events introduce security-specific tooling.

## Learning Objectives

Members should be able to:

- navigate the Linux filesystem
- create, copy, move, and inspect files
- search text
- understand basic permissions
- inspect processes
- identify basic network information
- explain what common shell commands are doing

## Core Commands

### Navigation

```bash
pwd
ls
ls -la
cd
```

### Files and Directories

```bash
mkdir
touch
cp
mv
rm
cat
less
head
tail
```

### Searching

```bash
grep
find
```

### System Information

```bash
whoami
id
ps
uname -a
```

### Networking

```bash
ip addr
ip route
ss -tulpn
```

## Guided Lab

Create the workspace:

```bash
mkdir -p ~/cyberclub/linux-lab/logs
cd ~/cyberclub/linux-lab
```

Create sample files:

```bash
echo "web01 192.168.56.20" > hosts.txt
echo "db01 192.168.56.30" >> hosts.txt

printf "INFO user=alex login=success\nWARNING user=sam login=failed\nINFO user=alex logout=success\n" > logs/auth.log
```

### Task 1 — Navigation

```bash
pwd
ls -la
cd logs
pwd
cd ..
```

### Task 2 — Reading Files

```bash
cat hosts.txt
head logs/auth.log
tail logs/auth.log
```

### Task 3 — Searching

```bash
grep WARNING logs/auth.log
grep alex logs/auth.log
```

### Task 4 — Copying and Moving

```bash
cp logs/auth.log logs/auth-backup.log
mv hosts.txt inventory.txt
```

### Task 5 — Permissions

```bash
ls -l
chmod 600 inventory.txt
ls -l inventory.txt
```

Discuss what owner/group/other permissions mean.

### Task 6 — Processes

```bash
ps
ps aux
```

Find your shell process.

### Task 7 — Networking

```bash
ip addr
ip route
ss -tulpn
```

Identify:

- one network interface
- your IP address
- the default route if present

## Investigation Workflow

For Linux investigations, build a habit of moving from broad to specific:

~~~text
Where am I?
   ↓
What files/directories exist?
   ↓
What is hidden?
   ↓
Which files contain the term I need?
   ↓
What does the matching evidence say?
   ↓
Who owns it / what are its permissions?
~~~

Example:

~~~bash
pwd
ls -la
find . -type f
grep -R "FAILED_LOGIN" .
ls -l <interesting-file>
~~~

Do not copy this sequence blindly. Understand what question each command answers.

## Challenge

Enter:

~~~bash
cd challenge
cat README.md
./setup.sh
~~~

The expanded challenge creates a small incident-style filesystem with:

- multiple log files,
- nested evidence directories,
- a hidden analyst note,
- file permissions,
- timestamps,
- an instructor-injected evidence flag.

Students locate and summarize evidence using only Linux terminal tools.

## Deliverable

Record both the **answer and command** used to determine:

1. failed-login count,
2. suspicious username,
3. suspicious source IP,
4. hidden-file clue,
5. evidence/flag path,
6. current user and groups,
7. one local interface/IP,
8. default route if present.

The goal is command familiarity plus evidence handling, not speed.

## Cleanup

For the guided lab:

```bash
rm -rf ~/cyberclub/linux-lab
```

The challenge has its own reset script.

## Next Event

[Beginner 03 — Networking Fundamentals](../03-networking-fundamentals/)
