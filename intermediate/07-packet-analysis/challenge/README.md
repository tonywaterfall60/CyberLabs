# Challenge — Reconstruct the Web Session

**Difficulty:** Intermediate  
**Estimated time:** 75–105 minutes

## Scope

~~~text
127.0.0.1:8300
~~~

## Goal

Reconstruct a short web session from network evidence and explain both what the packets prove and what they do not prove.

## Capture

Use Wireshark or:

~~~bash
sudo tcpdump -i lo tcp port 8300 -w session.pcap
~~~

Generate traffic in another terminal:

~~~bash
./generate-traffic.sh
~~~

## Analysis Phases

### 1 — Conversation Baseline

Identify source, destination, TCP port, approximate packet count, and TCP handshake evidence.

### 2 — HTTP Sequence

Recover the order of:

~~~text
/
/login
/api/profile
/api/profile
/logout
~~~

Record response codes.

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

## Deliverable

Submit the timeline, at least two filters, one tshark command, one stream observation, and a section labeled `Observed / Inferred / Unknown`.

## Cleanup

~~~bash
docker compose down
rm -f session.pcap
~~~