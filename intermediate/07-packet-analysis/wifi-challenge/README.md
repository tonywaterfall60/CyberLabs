# Optional Wireless Challenge — Crack the WiFi Handshake

**Track:** Intermediate (optional extension for Beginner 05 and Intermediate 07)  
**Time:** 45–75 minutes  
**Tools:** Wireshark and aircrack-ng  
**Scope:** Provided `wpa-handshake.pcap` and `wordlist.txt` ONLY. No wireless adapter or live testing is required.

## Scenario

You are investigating a captured WPA2 connection on a simulated training network. Find the 802.11 management frames, identify the access point and client, inspect the four-way EAPOL handshake, and test the supplied candidate passwords **offline** against the supplied capture.

## Student assets

- `wpa-handshake.pcap` — supplied 316-frame Wi-Fi capture
- `wordlist.txt` — small candidate-passphrase list

The [wifi-evidence.zip](wifi-evidence.zip) archive is included in this folder. Extract it to obtain the original capture and wordlist.

## Setup

On Kali, install tools if needed:

```bash
sudo apt update
sudo apt install wireshark aircrack-ng
```

From this challenge folder, extract the included archive and open the capture:

```bash
unzip -o wifi-evidence.zip
``` 

Then open:

```bash
wireshark wpa-handshake.pcap
```

## Tasks

1. **Network identification:** Find the SSID and AP BSSID using `wlan.fc.type_subtype == 0x08` (beacons) or probe responses. Find the joining station's MAC.
2. **Management frame analysis:** Use `wlan.fc.type_subtype == 0x0c`. What kind of management frames dominate the capture? Count them and describe their effect.
3. **Handshake:** Apply `eapol`. Identify the WPA2 four-way handshake, and explain what it allows an analyst to verify without disclosing a passphrase on the wire.
4. **Offline wordlist check:** Run `aircrack-ng -w wordlist.txt -b <BSSID> wpa-handshake.pcap`, replacing `<BSSID>` with the AP address you observed. Record the recovered lab-only passphrase.
5. **Defensive analysis:** Suggest three mitigations to resist weak WPA2-PSK selection or management-frame disruption. Explain what is directly observed versus inferred.

## Deliverable

```text
SSID:
BSSID (AP MAC):
Station MAC:
Management-frame type and count:
EAPOL/handshake observations:
Recovered lab passphrase:
Three recommended defenses:
Observed:
Inferred:
Unknown:
```

**Do not try this workflow against public, campus, or third-party wireless networks.** All analysis is limited to the prerecorded, authorized exercise.

## Instructor material

Answers, passphrase, suggested completion token, and teaching notes belong only in the private CyberLabs-Instructor repository.
