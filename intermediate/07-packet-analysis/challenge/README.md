# Challenge — Reconstruct the Web Session

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate |
| Estimated time | 75–105 minutes |
| Environment | Kali + Docker + Wireshark/tcpdump/tshark |
| Authorized scope | 127.0.0.1:8300 and your own generated capture |
| Goal | Reconstruct a local web session and state evidence limitations |
## Authorized Scope

~~~text
127.0.0.1:8300
~~~

## Scenario

Reconstruct a short web session from network evidence and explain both what the packets prove and what they do not prove.

## Setup

The event lead loads the private flag registry, then prepares runtime traffic artifacts before starting the service:

~~~bash
chmod +x prepare-flags.sh generate-traffic.sh
./prepare-flags.sh
docker compose up -d
~~~

## Objectives / Tasks

### Capture

Use Wireshark or:

~~~bash
sudo tcpdump -i lo tcp port 8300 -w session.pcap
~~~

Generate traffic in another terminal:

~~~bash
./generate-traffic.sh
~~~

### Analysis Phases

### 1 — Conversation Baseline

Identify source, destination, TCP port, approximate packet count, and TCP handshake evidence.

### 2 — HTTP Sequence

Recover the order of:

~~~text
/
/login
/api/profile
/runtime/timeline.txt
/api/profile
/logout
/runtime/limitations.txt
~~~

Record response codes.

The runtime timeline artifact carries the first dashboard flag inside the HTTP session.

### 3 — Header Correlation

Find the custom training/session header and determine which requests contain it.

### 4 — Streams

Follow at least two TCP streams and compare them.

### 5 — tshark Reproduction

Produce command-line output showing timestamps, source/destination, method/path, and response code.

### 6 — Timeline

Build:

~~~text
Time | Stream | Source | Destination | Method/Path | Status | Evidence | Interpretation
~~~

### 7 — Limitations

Answer:

- What can the capture prove about HTTP requests?
- What user identity can it prove?
- What application state is missing?
- How would HTTPS change visibility?

The final runtime limitations artifact carries the second dashboard flag. Recover both from the capture rather than from a local verifier.

## Deliverable

Submit both recovered flags to the CyberLabs dashboard, plus the timeline, at least two filters, one tshark command, one stream observation, and a section labeled `Observed / Inferred / Unknown`.

## Cleanup

~~~bash
docker compose down
rm -rf runtime
rm -f session.pcap
~~~