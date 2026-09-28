# Extra Practice 15 — Wireless Security Analysis

**Difficulty:** Intermediate → Advanced  
**Estimated time:** 90–120 minutes  
**Environment:** Kali Linux  
**Tools:** Wireshark, tshark, aircrack-ng, Python/Scapy  
**Infrastructure:** generated synthetic IEEE 802.11 PCAP; no wireless adapter required

## Scenario

A security team provides a packet capture from a fictional training wireless environment. You need to inventory the access points, identify client behavior, compare security configurations, and explain which observations are useful for a wireless security review.

Everything is synthetic.

## Safety / Scope

Use only:

~~~text
wireless-training.pcap
~~~

This lab does **not** require or authorize:

- monitor mode on a real interface,
- scanning nearby Wi-Fi networks,
- deauthentication/disassociation against real devices,
- password attacks against real networks,
- connecting to any discovered wireless network.

## Prerequisites

~~~bash
sudo apt update
sudo apt install -y aircrack-ng wireshark tshark python3-scapy
~~~

## Generate the Capture

~~~bash
python3 generate_wifi_pcap.py
sha256sum wireless-training.pcap
capinfos wireless-training.pcap
~~~

## Phase 1 — Wireless Inventory

Use Wireshark or tshark to identify:

~~~text
SSID
BSSID
channel
privacy/security indication
management frame types
client MAC addresses
~~~

Useful Wireshark filters:

~~~text
wlan.fc.type == 0
wlan.fc.type_subtype == 0x08
wlan.fc.type_subtype == 0x04
wlan.fc.type_subtype == 0x05
wlan.fc.type_subtype == 0x00
wlan.fc.type_subtype == 0x01
~~~

## Phase 2 — Beacon Analysis

For each AP build:

| SSID | BSSID | Channel | Privacy bit | RSN/WPA evidence | Notes |
|---|---|---:|---|---|---|

Explain why an SSID name alone does not prove who owns or operates an AP.

## Phase 3 — Client Probe Behavior

Find probe requests from the synthetic client.

Record:

~~~text
Client MAC:
SSID requested:
Broadcast or directed probe:
Timestamp:
~~~

Discuss why probe behavior can create privacy concerns without claiming every probe is dangerous.

## Phase 4 — Association Sequence

Identify:

~~~text
authentication request
authentication response
association request
association response
~~~

Build a short client/AP timeline.

## Phase 5 — Aircrack-ng Offline Inspection

~~~bash
aircrack-ng wireless-training.pcap
~~~

Record which networks Aircrack-ng identifies and what security information it can infer.

This synthetic capture is for **analysis**, not password recovery. If Aircrack-ng reports no crackable handshake/key material, that is expected and should be documented.

## Phase 6 — tshark Extraction

Create at least two useful field-extraction commands using fields such as:

~~~text
wlan.sa
wlan.da
wlan.bssid
wlan.ssid
wlan_radio.channel
wlan.fc.type_subtype
~~~

## Phase 7 — Security Assessment

For each AP answer:

1. What security indicators are visible?
2. Is it open or privacy-protected?
3. What would you need to know before judging whether its configuration is appropriate?
4. Which additional evidence would a real wireless assessment require?

## Phase 8 — Detection / Monitoring

Propose monitoring ideas for:

- unexpected SSID/BSSID appearances,
- a known SSID appearing from a new BSSID,
- unexpected open wireless networks,
- unusual authentication/association failures.

## Deliverable

~~~text
PCAP SHA-256:

Wireless inventory:
Client probe findings:
Association timeline:
Aircrack-ng observations:

Most important security observation:
Why:

Observed:
Inferred:
Unknown:

Additional evidence needed:
Wireless monitoring ideas:
~~~

## Cleanup

~~~bash
rm -f wireless-training.pcap
~~~
