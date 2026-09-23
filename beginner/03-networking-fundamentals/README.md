# Beginner 03 — Networking Fundamentals

**Difficulty:** Beginner  
**Estimated time:** 75–90 minutes  
**Prerequisites:** Beginner 01–02  
**Environment:** Member laptop; optional Linux VM

## Why This Event Exists

Most cybersecurity activity involves systems communicating over networks. Before using Wireshark or Nmap, members need to understand what IP addresses, DNS, ports, TCP, UDP, and gateways actually do.

## Learning Objectives

Members should be able to:

- explain IP and MAC addresses
- identify a subnet and default gateway at a basic level
- explain DNS
- explain why ports exist
- distinguish TCP and UDP
- recognize several common services
- describe what happens when a browser visits a website
- troubleshoot a simple connectivity problem

## Core Concepts

### IP Address

An IP address identifies a network interface at Layer 3.

Example:

```text
192.168.56.20
```

### MAC Address

A MAC address identifies a network interface at Layer 2 on the local network.

### Subnet

A subnet groups addresses that can communicate locally according to the network configuration.

Example:

```text
192.168.56.0/24
```

### Default Gateway

The default gateway is where traffic is sent when the destination is outside the local network.

### DNS

DNS translates hostnames into IP addresses.

```text
example.com → 93.184.216.34
```

### Ports

A single host can run many services. Ports help identify which service a connection is intended for.

| Port | Typical Service |
|---:|---|
| 22 | SSH |
| 53 | DNS |
| 80 | HTTP |
| 443 | HTTPS |

### TCP vs. UDP

**TCP**
- connection-oriented
- reliable delivery
- ordered stream

**UDP**
- connectionless
- lower overhead
- no built-in guarantee of delivery

## Guided Lab

### Task 1 — View Your Configuration

Linux:

```bash
ip addr
ip route
```

Windows:

```powershell
ipconfig
route print
```

Record:

```text
IP address:
Subnet/prefix:
Default gateway:
DNS server:
```

### Task 2 — Test the Local Stack

```bash
ping 127.0.0.1
```

Explain what loopback means.

### Task 3 — Test the Gateway

```bash
ping <your-default-gateway>
```

Discuss what a successful or failed result does and does not prove.

### Task 4 — DNS Resolution

```bash
nslookup example.com
```

or:

```bash
dig example.com
```

Identify the query name and returned address.

### Task 5 — Trace the Web Request

Describe:

```text
User enters URL
      ↓
DNS resolves hostname
      ↓
Client knows destination IP
      ↓
TCP connection is established
      ↓
HTTP/HTTPS request is sent
      ↓
Server responds
      ↓
Browser renders content
```

## Troubleshooting Exercise

For each symptom, identify a likely area to investigate:

1. hostname does not resolve
2. host responds to ping but web page does not load
3. HTTP works but HTTPS does not
4. local host is reachable but remote networks are not
5. browser works by IP but not by hostname

## Challenge

Open:

```text
challenge/README.md
```

The challenge gives you a fictional network and several failure reports. Use the provided data to identify the likely failure point.

## Deliverable

Write a short explanation of what happens when a browser visits a website, using at least these terms:

- DNS
- IP
- TCP
- port
- HTTP or HTTPS

## Next Event

[Beginner 04 — Command Line Workshop](../04-command-line-workshop/)
