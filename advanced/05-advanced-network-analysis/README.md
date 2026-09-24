# Advanced 05 — Advanced Network Analysis

**Difficulty:** Advanced  
**Estimated time:** 120 minutes  
**Prerequisites:** Intermediate Packet Analysis  
**Environment:** Kali Linux, Python/Scapy, Wireshark, tshark, tcpdump

## Why This Event Exists

Advanced packet analysis is less about locating one request and more about identifying patterns across multiple flows. This event uses an offline synthetic PCAP so students can investigate timing, conversations, DNS, and recurring traffic without generating suspicious live traffic.

## Learning Objectives

- identify top talkers and conversations
- correlate DNS with later connections
- detect recurring periodic traffic
- extract fields with tshark
- build a timeline
- identify indicators
- distinguish suspicious behavior from confirmed malicious activity

## Generate the Dataset

~~~bash
cd challenge
python3 generate_pcap.py
~~~

Output:

~~~text
advanced-network.pcap
~~~

## Suggested Workflow

Conversation summary:

~~~bash
tshark -r advanced-network.pcap -q -z conv,ip
~~~

DNS:

~~~bash
tshark -r advanced-network.pcap -Y dns
~~~

Extract endpoints and destination ports:

~~~bash
tshark -r advanced-network.pcap -T fields -e frame.time_epoch -e ip.src -e ip.dst -e tcp.dstport
~~~

Open graphically:

~~~bash
wireshark advanced-network.pcap
~~~

Ask: Which host repeatedly contacts the same destination? What is the interval? Which hostname appears near that activity? What other traffic looks normal?

## Optional

If Zeek is already installed, process the synthetic PCAP and compare Zeek logs with Wireshark/tshark observations.

## Deliverable

~~~text
Top talkers:
Recurring flow:
Interval:
Associated DNS name:
Timeline:
Indicators:
Alternative explanation:
Additional telemetry needed:
Confidence:
~~~

## Next Event

[Advanced 06 — Threat Hunting](../06-threat-hunting/)