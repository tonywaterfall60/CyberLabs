# Beginner 06 — Intro to Nmap

**Time:** 75–90 minutes  
**Prerequisites:** Beginner 03–05  
**Environment:** Two local VMs on an isolated host-only network

## Learning Objectives

Members should be able to:

- explain what a port scan does
- identify open ports on an authorized target
- distinguish host discovery from service discovery
- document findings clearly

## Safety / Scope

Use Nmap only against the instructor-provided local target.

Do not scan campus infrastructure, public Internet systems, or other members' devices.

## Recommended Network

```text
Student VM     192.168.56.10
Target VM      192.168.56.20
```

## Lab

### Task 1 — Verify Connectivity

```bash
ping 192.168.56.20
```

### Task 2 — Basic Scan

```bash
nmap 192.168.56.20
```

Record any open ports.

### Task 3 — Service Identification

```bash
nmap -sV 192.168.56.20
```

Compare the results with the first scan.

### Task 4 — Specific Ports

```bash
nmap -p 22,80,443 192.168.56.20
```

Discuss why targeted scans may be useful.

## Reporting Exercise

Create a small table:

| Port | State | Service | What it may be used for |
|---|---|---|---|

## Challenge

Explain the difference between:

- a host being reachable
- a port being open
- a service being identified

## Cleanup

Shut down or restore the target VM snapshot.
