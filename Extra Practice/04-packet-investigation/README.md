# Extra Practice 04 — Packet Investigation

**Difficulty:** Intermediate → Advanced  
**Estimated time:** 90–120 minutes  
**Environment:** Kali Linux  
**Tools:** Wireshark, tshark, tcpdump concepts, Python/Scapy  
**Infrastructure:** offline synthetic PCAP with DNS, HTTP-like, authentication-like, and recurring traffic

## Scenario

A security analyst captured a short segment of network traffic from a training subnet after users reported intermittent account problems.

Your task is to determine:

- which conversations look normal,
- which host deserves additional attention,
- whether DNS activity can be correlated with later traffic,
- whether there is a recurring connection pattern,
- what conclusions the PCAP supports,
- what additional telemetry would be needed.

This is an offline investigation. No live target is required.

## Scope

Authorized evidence:

~~~text
practice-investigation.pcap
~~~

Do not pivot from IP addresses or hostnames in the PCAP to real systems. All addresses and domains are synthetic.

## Infrastructure

The PCAP represents:

~~~text
10.55.0.10  analyst workstation
10.55.0.20  internal web portal
10.55.0.30  user workstation
10.55.0.53  DNS server
10.55.0.99  telemetry destination
~~~

Traffic includes DNS queries, normal HTTP-like requests, a failed/successful login sequence, periodic traffic from one workstation, and unrelated background traffic.

## Setup

The generator requires Scapy.

~~~bash
sudo apt update
sudo apt install -y python3-scapy
python3 generate_pcap.py
~~~

Verify:

~~~bash
ls -lh practice-investigation.pcap
capinfos practice-investigation.pcap
~~~

If capinfos is unavailable, continue with Wireshark/tshark.

## Phase 1 — Establish a Baseline

~~~bash
tshark -r practice-investigation.pcap -q -z conv,ip
~~~

Record communicating hosts, packet counts, and destinations that appear repeatedly. Do not label anything malicious yet.

## Phase 2 — DNS Analysis

~~~bash
tshark -r practice-investigation.pcap -Y dns
~~~

Record timestamp, requester, queried hostname, and related host/IP context.

Answer which workstation queried the internal portal, which queried the telemetry-like domain, and whether DNS timing aligns with later traffic.

## Phase 3 — HTTP-Like Activity

~~~bash
tshark -r practice-investigation.pcap -Y 'tcp.port == 8080'
~~~

Use Wireshark Follow TCP Stream where useful.

Determine which workstation accessed the internal portal, which paths were requested, whether a login sequence is visible, and whether success followed failures.

## Phase 4 — Recurring Traffic

Identify traffic to TCP 9443.

~~~bash
tshark -r practice-investigation.pcap -Y 'tcp.dstport == 9443' -T fields -e frame.time_epoch -e ip.src -e ip.dst -e tcp.dstport
~~~

Calculate source, destination, count, approximate interval, and whether the behavior is periodic.

## Phase 5 — Timeline

Create:

~~~text
Timestamp | Source | Destination | Protocol/Port | Event | Evidence | Interpretation
~~~

Include at least one DNS event, one authentication-related event, one internal web event, and three recurring events.

## Phase 6 — Analysis

Separate:

~~~text
Observed:
Inferred:
Unknown:
~~~

Then answer which host deserves the most follow-up, what the strongest evidence is, what legitimate explanations remain possible, whether the PCAP proves malware, and whether it proves account compromise.

## Phase 7 — Additional Telemetry

Request at least four useful evidence sources and explain what question each would answer.

Examples include endpoint process telemetry, authentication logs, DNS resolver logs, proxy/firewall logs, EDR telemetry, and server application logs.

## Deliverable

~~~text
PCAP SHA-256:
Top conversations:
DNS findings:
Authentication findings:
Recurring flow:
Interval:
Timeline:

Observed:
Inferred:
Unknown:

Highest-priority host:
Reason:
Alternative explanation:
Additional telemetry:
Confidence:
~~~

Hash the evidence:

~~~bash
sha256sum practice-investigation.pcap
~~~

## Cleanup

~~~bash
rm -f practice-investigation.pcap
~~~