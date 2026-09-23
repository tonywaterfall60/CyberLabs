# Beginner 04 — Command Line Workshop

**Difficulty:** Beginner  
**Estimated time:** 75–90 minutes  
**Prerequisites:** Beginner 02–03  
**Environment:** Linux VM, WSL, or terminal

## Why This Event Exists

Cybersecurity analysts frequently need to turn raw files and logs into useful information quickly. This event teaches members to combine small command-line tools into repeatable workflows.

## Learning Objectives

Members should be able to:

- understand standard input/output at a basic level
- use pipes
- redirect output
- search and count log entries
- sort and extract useful data
- inspect basic process/network state
- build simple command pipelines

## Core Concepts

### Standard Output

Commands normally print output to the terminal.

```bash
cat file.txt
```

### Redirection

Write output into a file:

```bash
command > output.txt
```

Append instead of replace:

```bash
command >> output.txt
```

### Pipes

Send output from one command into another:

```bash
command1 | command2
```

Example:

```bash
grep WARNING app.log | wc -l
```

## Guided Lab Setup

```bash
mkdir -p ~/cyberclub/cli-lab/logs
cd ~/cyberclub/cli-lab

printf "INFO user=alex action=login\nWARNING user=sam action=failed_login\nINFO user=alex action=logout\nWARNING user=sam action=failed_login\n" > logs/auth.log

printf "web01,192.168.56.20,80\nssh01,192.168.56.21,22\ndns01,192.168.56.22,53\n" > hosts.csv
```

## Guided Tasks

### Search the Log

```bash
grep WARNING logs/auth.log
```

### Count Failed Events

```bash
grep WARNING logs/auth.log | wc -l
```

### Save Results

```bash
grep WARNING logs/auth.log > warnings.txt
```

### Extract Fields

```bash
cut -d, -f1 hosts.csv
cut -d, -f2 hosts.csv
```

### Sort Data

```bash
sort hosts.csv
```

### Inspect Processes and Sockets

```bash
ps aux
ss -tulpn
```

## Mini Exercises

Build commands that:

1. count lines containing `INFO`
2. save all failed-login events to a new file
3. extract only hostnames from `hosts.csv`
4. sort those hostnames alphabetically

## Challenge

Run:

```bash
cd challenge
./setup.sh
cat README.md
```

The challenge gives you a larger authentication log. Solve it using pipelines instead of manually reading every line.

## Deliverable

Provide the command pipelines used to answer the challenge questions.

## Cleanup

```bash
rm -rf ~/cyberclub/cli-lab
```

Use `challenge/reset.sh` for the challenge data.

## Next Event

[Beginner 05 — Intro to Wireshark](../05-intro-to-wireshark/)
