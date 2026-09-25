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

~~~text
Conversation baseline
      ↓
Top talkers
      ↓
DNS / protocol context
      ↓
Identify all periodic flows
      ↓
Compare suspicious-looking vs. known-benign periodicity
      ↓
Build host-specific timeline
      ↓
Generate competing hypotheses
      ↓
Request endpoint/server telemetry
      ↓
State confidence
~~~

Useful commands:

~~~bash
tshark -r advanced-network.pcap -q -z conv,ip
tshark -r advanced-network.pcap -Y dns
tshark -r advanced-network.pcap -T fields -e frame.time_epoch -e ip.src -e ip.dst -e tcp.dstport
~~~

Open graphically with Wireshark to inspect timing and payload clues.

The expanded PCAP deliberately contains **more than one periodic flow**, so students must avoid the simplistic rule that periodic traffic automatically means beaconing or malware.

## Optional

If Zeek is already installed, process the synthetic PCAP and compare Zeek logs with Wireshark/tshark observations.

## Deliverable

~~~text
PCAP SHA-256:
Top talkers:
Recurring flows:

Host-of-interest timeline:
DNS correlation:

Primary hypothesis:
Competing hypotheses:
Evidence supporting each:
Evidence against each:

Additional telemetry requested:
Confidence:
Unknowns:
~~~

A strong Advanced answer explains what the PCAP can establish and what still requires endpoint/application context.

## Next Event

[Advanced 06 — Threat Hunting](../06-threat-hunting/)