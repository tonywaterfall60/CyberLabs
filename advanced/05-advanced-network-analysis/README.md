# Advanced 05 — Advanced Network Analysis

**Difficulty:** Advanced  
**Estimated time:** 120 minutes  
**Prerequisites:** Intermediate Packet Analysis  
**Environment:** Kali Linux, Python/Scapy, Wireshark, tshark, tcpdump

## Learning Objectives

Students should be able to:

- analyze a multi-flow PCAP
- identify beacon-like periodic activity
- correlate DNS and TCP/HTTP behavior
- extract fields with tshark
- build a timeline
- identify indicators while avoiding unsupported conclusions

## Challenge Model

The challenge generates a **synthetic PCAP offline**.

No live attack traffic is sent.

## Tools

- Wireshark
- tshark
- tcpdump
- Python / Scapy
- optional Zeek if available

## Challenge

```bash
cd challenge
python3 generate_pcap.py
cat README.md
```

## Deliverable

- top talkers
- suspicious recurring flow
- associated DNS name
- timeline
- indicators
- confidence statement
- defensive follow-up recommendations

## Next Event

[Advanced 06 — Threat Hunting](../06-threat-hunting/)
