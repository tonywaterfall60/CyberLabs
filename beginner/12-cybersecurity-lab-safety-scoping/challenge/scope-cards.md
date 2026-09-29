# Scope Cards

## Card A — Web Lab
Authorized: 127.0.0.1 port 8070 only.
Allowed: browser, curl, Burp Repeater.
Not allowed: scanning other ports, brute force, denial of service.

## Card B — Network Lab
Authorized: 172.28.50.0/28.
Allowed: host discovery, TCP service detection, manual validation.
Not allowed: any other subnet.

## Card C — Forensics Lab
Authorized: files under ~/cyberclub/case-17/.
Allowed: read, hash, copy into an analysis directory.
Not allowed: modifying originals.

## Card D — Wireless Lab
Authorized: supplied offline PCAP only.
Allowed: Wireshark/tshark/aircrack-ng offline inspection.
Not allowed: monitor mode, deauthentication, nearby Wi-Fi scanning.
