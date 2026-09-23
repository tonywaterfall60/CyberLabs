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

## Challenge

Enter:

```bash
cd challenge
cat README.md
./setup.sh
```

The challenge creates a small fake incident-response filesystem. Your job is to locate clues using Linux commands only.

## Deliverable

Record the commands used to:

1. locate a suspicious log entry
2. find a hidden file
3. identify the current user
4. identify the machine's IP address

## Cleanup

For the guided lab:

```bash
rm -rf ~/cyberclub/linux-lab
```

The challenge has its own reset script.

## Next Event

[Beginner 03 — Networking Fundamentals](../03-networking-fundamentals/)
