# Beginner 04 — Command Line Workshop

**Time:** 75–90 minutes  
**Prerequisites:** Beginner 02–03  
**Environment:** Linux VM, WSL, or terminal

## Learning Objectives

Members will practice:

- combining commands
- pipes and redirection
- searching files
- inspecting processes
- basic network troubleshooting from the terminal

## Setup

```bash
mkdir -p ~/cyberclub/cli-lab/logs
cd ~/cyberclub/cli-lab

printf "INFO user=alex action=login\nWARNING user=sam action=failed_login\nINFO user=alex action=logout\nWARNING user=sam action=failed_login\n" > logs/auth.log
printf "web01,192.168.56.20,80\nssh01,192.168.56.21,22\ndns01,192.168.56.22,53\n" > hosts.csv
```

## Tasks

### 1. Read and Search

```bash
cat logs/auth.log
grep WARNING logs/auth.log
```

### 2. Count Results

```bash
grep WARNING logs/auth.log | wc -l
```

### 3. Redirect Output

```bash
grep WARNING logs/auth.log > warnings.txt
cat warnings.txt
```

### 4. Sort and Inspect

```bash
sort hosts.csv
head hosts.csv
tail hosts.csv
```

### 5. Process Inspection

```bash
ps aux
```

Find your shell process.

### 6. Network Inspection

```bash
ip addr
ip route
ss -tulpn
```

## Challenge

Create one command pipeline that:

1. finds all `WARNING` lines,
2. counts them,
3. writes the result into `warning-count.txt`.

## Reflection

Why are command pipelines useful to cybersecurity analysts?

## Cleanup

```bash
rm -rf ~/cyberclub/cli-lab
```
