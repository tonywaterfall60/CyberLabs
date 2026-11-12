# Wi-Fi Challenge — Investigate a WPA2 Handshake

**Track:** Intermediate 07 — Protocol / Packet Analysis (also optional after Beginner 05)  
**Estimated time:** 45–75 minutes  
**Tools:** Wireshark, tshark (optional), aircrack-ng  
**Authorized scope:** The supplied offline evidence only. **No wireless adapter, live AP, or active wireless testing is needed.**

## Scenario

A security analyst received a recorded Wi-Fi capture from a fictional training network. Your job is to identify the network and station, investigate unusual management traffic, examine the authentication exchange, and test the **provided** candidate-password list against the **provided** PCAP.

This is a **question-based investigation**: answer **WIFI-Q1 through WIFI-Q12** using the capture, not guesses. The instructor has a private answer key with specific grading values.

## Get the latest challenge files

If CyberLabs is not on your machine yet, run this **once**:

```bash
cd ~
git clone https://github.com/tonywaterfall60/CyberLabs.git
```

If you already cloned it, **update rather than clone again**:

```bash
git -C ~/CyberLabs pull --ff-only origin main
```

## Prepare the offline evidence

From a Kali terminal:

```bash
cd ~/CyberLabs/intermediate/07-packet-analysis/wifi-challenge
unzip -o wifi-evidence.zip
wireshark wpa-handshake.pcap
```

The archive includes `wpa-handshake.pcap` and a small `wordlist.txt`. If a tool is missing:

```bash
sudo apt update
sudo apt install wireshark tshark aircrack-ng unzip
```

## Part 1 — Wireless discovery (4 points)

Use **Wireshark → Statistics → Capture File Properties** and inspect 802.11 beacon/probe-response frames.

| ID | Investigation question | Your answer |
|---|---|---|
| **WIFI-Q1** | How many **total frames** are in the supplied capture? | |
| **WIFI-Q2** | What is the wireless network's **SSID** (exact spelling)? | |
| **WIFI-Q3** | What is the access point's **BSSID / MAC address** (six hex pairs)? | |
| **WIFI-Q4** | What is the **client/station MAC address** joining that AP? | |

Hint: `wlan.fc.type_subtype == 0x08` can show beacon frames. Expand the 802.11 header to distinguish transmitter, receiver, BSSID, and station addresses.

## Part 2 — Management frames (3 points)

Apply `wlan.fc.type_subtype == 0x0c` and check the number of **displayed** packets.

| ID | Investigation question | Your answer |
|---|---|---|
| **WIFI-Q5** | Which 802.11 management-frame type has subtype **0x08**? | |
| **WIFI-Q6** | Which management-frame type has subtype **0x0c**, and **exactly how many** appear? | |
| **WIFI-Q7** | What effect can a burst of these 0x0c frames have on a connected client? | |

Record at least one supporting frame number for WIFI-Q6. Do not assume you know who sent the frames or why.

## Part 3 — WPA2 handshake and offline validation (3 points)

Filter `eapol`. Inspect the nearby frames and the network's security information.

| ID | Investigation question | Your answer |
|---|---|---|
| **WIFI-Q8** | Which **authentication/key-exchange sequence** is visible, and does it send the Wi-Fi password in plaintext? | |
| **WIFI-Q9** | What **wireless security / cipher combination** does the evidence show? | |
| **WIFI-Q10** | Which **exact training passphrase** does the provided offline wordlist check recover? | |

After recording the BSSID from WIFI-Q3, run (replace the placeholder with that BSSID):

```bash
aircrack-ng -w wordlist.txt -b <BSSID_FROM_Q3> wpa-handshake.pcap
```

**Important:** `<BSSID_FROM_Q3>` is a placeholder, not literal terminal syntax. Use only the included wordlist and prerecorded capture. The private instructor answer key contains the expected passphrase; it is not posted in the student repository.

## Part 4 — Defensive interpretation (2 points)

| ID | Investigation question | Your answer |
|---|---|---|
| **WIFI-Q11** | Name **three distinct mitigations** for weak WPA2 passwords or management-frame disruption; give one sentence explaining each. | |
| **WIFI-Q12** | Separate the evidence into **Observed**, **Inferred**, and **Unknown**. What can you prove from this PCAP, and what cannot you prove about the cause? | |

## Submission template

Copy and fill this in. Use exact case for SSIDs and passphrases, and colon-separated MAC addresses.

```text
WIFI-Q1:
WIFI-Q2:
WIFI-Q3:
WIFI-Q4:
WIFI-Q5:
WIFI-Q6:
WIFI-Q7:
WIFI-Q8:
WIFI-Q9:
WIFI-Q10:
WIFI-Q11:
WIFI-Q12:

Evidence: frame number(s) for Q3/Q4/Q6/Q8:
Display filters used:
Offline command run:
Observed / Inferred / Unknown:
```

**Grading:** 12 questions × 1 point = **12 instructor-reviewed points**. If an event lead separately registers a dashboard flag, they will provide submission instructions; the recovered passphrase alone is not necessarily a registered dashboard flag.

**Safety:** Do not capture nearby devices, send deauthentication frames, test campus Wi-Fi, or attempt to recover passwords from networks you do not own. This exercise is offline and self-contained.
