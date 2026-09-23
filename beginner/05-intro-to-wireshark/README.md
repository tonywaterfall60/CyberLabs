# Beginner 05 — Intro to Wireshark

**Time:** 75–90 minutes  
**Prerequisites:** Beginner 03–04  
**Environment:** Wireshark installed; local traffic only

## Learning Objectives

Members should be able to:

- capture local network traffic
- distinguish packets by protocol
- use basic display filters
- identify DNS and TCP traffic
- recognize the TCP three-way handshake

## Safety / Scope

Capture only traffic from your own computer or the instructor-provided lab environment.

Do not capture or inspect other users' traffic without authorization.

## Lab

### Task 1 — Start a Capture

Open Wireshark and choose the active interface.

Start a capture.

### Task 2 — Generate Safe Traffic

In a terminal:

```bash
nslookup example.com
ping 127.0.0.1
```

If Internet access is allowed for the event, visit:

```text
https://example.com
```

Stop the capture.

### Task 3 — Basic Filters

Try:

```text
dns
tcp
icmp
```

Discuss what changes when each filter is applied.

### Task 4 — DNS

Filter:

```text
dns
```

Identify:

- the queried hostname
- the query packet
- the response packet

### Task 5 — TCP Handshake

Filter:

```text
tcp
```

Find packets representing:

```text
SYN
SYN-ACK
ACK
```

## Challenge

Answer:

1. What protocol translated a hostname to an IP?
2. Which protocol carried the reliable connection?
3. What is the purpose of the SYN packet?
4. Why is packet capture useful to defenders?

## Deliverable

Save one screenshot showing a Wireshark filter and explain what the filtered packets represent.

## Cleanup

Stop the capture and close Wireshark.
