# Beginner 05 Challenge — Question-Based Local Packet Investigation

**Time:** 40–55 minutes  
**Tools:** Kali, Docker, Wireshark, tshark  
**Authorized scope:** Only your local service at `127.0.0.1:8085`  
**Goal:** Reconstruct a six-request HTTP session, identify TCP behavior, and recover two instructor-injected **runtime** dashboard flags from the captured HTTP traffic.

## Setup (event lead)

The event lead must load the private `BEGINNER_WIRESHARK_*` flag environment through the normal instructor setup process. Then, from this folder:

```bash
chmod +x prepare-flags.sh generate-traffic.sh
./prepare-flags.sh
docker compose up -d
curl -fsS http://127.0.0.1:8085/
```

**If the flag environment was not loaded**, the generated artifacts will contain `FLAG_NOT_CONFIGURED` and cannot be submitted as real flags. Ask your event lead to fix the setup.

## Create a capture

1. In Wireshark, select the interface carrying traffic for `127.0.0.1` (normally **lo** on Kali). Begin recording **before** generating traffic.
2. In a different terminal, from this challenge directory, run:

```bash
./generate-traffic.sh
```

3. Stop the capture after the script finishes and save it as `challenge.pcap` in this folder.

Useful Wireshark **display** filters:

```text
tcp.port == 8085
http.request
http.response
tcp.flags.syn == 1
```

For a TCP conversation, select a packet and choose **Follow → TCP Stream**. A display filter hides nonmatching rows; it does not remove packets from the saved capture.

## Answer these questions

All questions have defined answers in the **private instructor repository**. Include a packet/frame number or relevant screenshot for your observations.

### Part 1 — Identify the conversation (4 points)

| ID | Question | Your answer |
|---|---|---|
| **B05-C1** | What **IP address and TCP service port** does the generator contact? | |
| **B05-C2** | Which **capture interface** normally carries this local traffic on Kali? | |
| **B05-C3** | Which **transport protocol** and **application protocol** carry the service requests? | |
| **B05-C4** | Which **HTTP request method** is used for every generated request? | |

### Part 2 — Reconstruct the session (3 points)

| ID | Question | Your answer |
|---|---|---|
| **B05-C5** | Write the **exact six HTTP request paths, in the order they were captured**. | |
| **B05-C6** | How many HTTP requests does the script generate, and **which path is requested twice**? | |
| **B05-C7** | Which **HTTP status code** do the six requests return when the service and runtime evidence are prepared correctly? | |

Tip: you can extract paths and response codes from your saved file:

```bash
tshark -r challenge.pcap -Y http.request -T fields -e frame.number -e http.request.method -e http.request.uri
tshark -r challenge.pcap -Y http.response -T fields -e frame.number -e http.response.code
```

If you ran extra `curl` commands during recording, **isolate the script's six consecutive requests** rather than counting unrelated traffic.

### Part 3 — TCP and private evidence (3 points)

| ID | Question | Your answer |
|---|---|---|
| **B05-C8** | What are the **three steps / TCP flags** in the connection handshake, in order? | |
| **B05-C9** | Which **HTTP request path** returns the runtime **analysis** flag? Recover the value from the **captured response**, not from local files. | |
| **B05-C10** | Which **HTTP request path** returns the runtime **PCAP marker** flag? Recover the value from the **captured response**, not from local files. | |

To find the two flags, select their HTTP responses and inspect the response body or **Follow TCP Stream**. Your event lead must have installed valid private flags before recording.

### Part 4 — Validate evidence (1 point)

| ID | Question | Your answer |
|---|---|---|
| **B05-C11** | Give one working `tshark` command that shows only HTTP requests in `challenge.pcap`. | |

Also calculate the file's SHA-256 (the value will depend on **your** recording):

```bash
sha256sum challenge.pcap
```

## Submission

Submit the **two captured runtime flags** to the CyberLabs dashboard. Give the instructor this worksheet:

```text
B05-C1:
B05-C2:
B05-C3:
B05-C4:
B05-C5:
B05-C6:
B05-C7:
B05-C8:
B05-C9: [path and dashboard flag submitted separately]
B05-C10: [path and dashboard flag submitted separately]
B05-C11:

Evidence frame number(s):
Six-request timeline:
Follow TCP Stream observation:
challenge.pcap SHA-256:
```

**Grading:** 11 questions × 1 point = **11 points**, plus up to 3 evidence points (frame/screenshot, timeline or stream, and PCAP hash). Dashboard flag scores are separate.

## Cleanup

```bash
docker compose down
rm -rf runtime
rm -f challenge.pcap
```

Do not send captures or findings to systems outside the authorized lab.
