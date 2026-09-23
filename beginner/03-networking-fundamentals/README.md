# Beginner 03 — Networking Fundamentals

**Difficulty:** Beginner  
**Estimated time:** 75–90 minutes  
**Prerequisites:** Beginner 01–02  
**Environment:** Kali Linux VM or member laptop

## Why This Event Exists

Most cybersecurity activity involves systems communicating over networks. Before using Wireshark or Nmap, members need to understand what IP addresses, DNS, ports, TCP, UDP, gateways, and routes actually do.

This event also begins introducing common Kali networking tools in a low-pressure way.

## Learning Objectives

Members should be able to:

- explain IP and MAC addresses
- identify a subnet and default gateway at a basic level
- explain DNS
- explain why ports exist
- distinguish TCP and UDP
- recognize several common services
- describe what happens when a browser visits a website
- use basic Kali networking commands
- troubleshoot a simple connectivity problem

## Kali Tools Introduced

| Tool | Purpose |
|---|---|
| `ip` | view addresses and routes |
| `ping` | basic reachability testing |
| `dig` | DNS queries |
| `traceroute` | view network path hops |
| `ss` | inspect local sockets |
| `curl` | test HTTP connectivity |

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

```bash
ip addr
ip route
```

Record:

```text
IP address:
Subnet/prefix:
Default gateway:
```

### Task 2 — Inspect Local Sockets

```bash
ss -tulpn
```

Discuss:

- listening sockets
- TCP vs. UDP
- port numbers

### Task 3 — Test Loopback

```bash
ping -c 4 127.0.0.1
```

Explain what loopback means.

### Task 4 — DNS with dig

```bash
dig example.com
```

Focus on:

- QUESTION SECTION
- ANSWER SECTION
- returned address

Short output:

```bash
dig +short example.com
```

### Task 5 — Trace a Route

If Internet access is allowed:

```bash
traceroute example.com
```

Discuss why some hops may not respond and why traceroute output is not a complete map of the Internet.

### Task 6 — Test HTTP with curl

```bash
curl -I https://example.com
```

Identify:

- response status
- headers

### Task 7 — Trace the Web Request

Describe:

```text
User enters URL
      ↓
DNS resolves hostname
      ↓
Client knows destination IP
      ↓
Routing chooses a path
      ↓
TCP connection is established
      ↓
HTTP/HTTPS request is sent
      ↓
Server responds
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

The challenge gives you a fictional network and several failure reports.

## Deliverable

Write a short explanation of what happens when a browser visits a website, using:

- DNS
- IP
- route/gateway
- TCP
- port
- HTTP or HTTPS

## Next Event

[Beginner 04 — Command Line Workshop](../04-command-line-workshop/)
