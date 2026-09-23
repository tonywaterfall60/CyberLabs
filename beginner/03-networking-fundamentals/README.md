# Beginner 03 — Networking Fundamentals

**Time:** 75–90 minutes  
**Prerequisites:** Beginner 01–02  
**Environment:** Member laptop; optional Linux VM

## Learning Objectives

By the end of this event, members should be able to:

- explain the purpose of IP addresses, MAC addresses, DNS, ports, TCP, and UDP
- distinguish a local network from the Internet
- identify their own IP configuration
- explain what happens when a browser visits a website
- recognize common ports and services

## Concepts

### IP Address
An IP address identifies a device or interface on a network.

### MAC Address
A MAC address identifies a network interface at Layer 2.

### DNS
DNS translates names such as `example.com` into IP addresses.

### Ports
Ports help identify services on a host.

Common examples:

| Port | Service |
|---|---|
| 22 | SSH |
| 53 | DNS |
| 80 | HTTP |
| 443 | HTTPS |

### TCP vs. UDP

TCP is connection-oriented and emphasizes reliable delivery. UDP is connectionless and is commonly used where low overhead or speed is important.

## Hands-On Lab

### Task 1 — View Local Network Information

Linux:

```bash
ip addr
ip route
```

Windows:

```powershell
ipconfig
```

Record:

- your local IP address
- subnet mask/prefix
- default gateway

### Task 2 — Test Connectivity

```bash
ping 127.0.0.1
ping <your-default-gateway>
```

Discuss what each test proves.

### Task 3 — DNS

Try:

```bash
nslookup example.com
```

or:

```bash
dig example.com
```

Identify the returned IP address.

### Task 4 — Follow a Web Request

As a group, describe this sequence:

```text
Browser
  ↓
DNS lookup
  ↓
IP address
  ↓
TCP connection
  ↓
HTTP/HTTPS request
  ↓
Web server response
```

## Challenge

For each situation, identify which component is most likely involved:

1. A hostname does not resolve.
2. A host responds to ping, but its website does not load.
3. A web server is reachable on port 80 but not port 443.
4. Two devices have addresses on the same subnet.

## Deliverable

Write a short explanation of what happens when you type a URL into a browser.

## Cleanup

No cleanup required.
