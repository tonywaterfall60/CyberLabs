# Beginner 05 Challenge — Local Wireshark Investigation (No Docker)

**Time:** 40–55 minutes  
**Tools:** Kali Linux, Python 3, curl, Wireshark, tshark  
**Authorized scope:** Your own loopback traffic at `127.0.0.1:8085` only  
**Goal:** Capture six HTTP requests, reconstruct their order, inspect a TCP handshake, and answer 11 questions.

This lab uses **Python's built-in HTTP server**. It does **not** require Docker, Docker Compose, a VM network bridge, or an Internet connection. The `site/` folder contains the fictional training pages.

## 1. Prepare the local evidence

Open a terminal in the challenge folder:

```bash
cd ~/CyberLabs/beginner/05-intro-to-wireshark/challenge
bash prepare-flags.sh
```

This creates the two response files used by the questions. If you see `FLAG_NOT_CONFIGURED`, **the investigation still works for practice**, but those placeholder values **are not valid dashboard flags**.

**Event leads:** For a scored event, load the two values `BEGINNER_WIRESHARK_ANALYSIS_FLAG` and `BEGINNER_WIRESHARK_PCAP_FLAG` from the **private instructor repository** before running `bash prepare-flags.sh`. Never copy the private flag registry into the public student repository. For students who do not have those values, the instructor can also prepare and distribute a PCAP recorded with the flags already injected.

## 2. Start the HTTP server — Terminal 1

From the `challenge/` folder, run:

```bash
python3 -m http.server 8085 --bind 127.0.0.1 --directory site
```

**Leave this terminal open.** It is the server, so the command keeps running until you press **Ctrl+C**.

You should see a message similar to:

```text
Serving HTTP on 127.0.0.1 port 8085 ...
```

## 3. Verify it is running — Terminal 2

In a **second** terminal:

```bash
curl -i http://127.0.0.1:8085/status
```

Expected: HTTP `200 OK` and a text response containing `status=online`.

If you get **connection refused**, Terminal 1 is not running. If you get **address already in use**, another process occupies port 8085; stop the old local server rather than silently changing ports, because the worksheet uses 8085.

## 4. Record packets — Wireshark

1. Open Wireshark and select the **lo** (loopback) interface on Kali.
2. Start capturing before generating the traffic.
3. Keep Wireshark recording and return to Terminal 2:

```bash
cd ~/CyberLabs/beginner/05-intro-to-wireshark/challenge
bash generate-traffic.sh
```

4. Wait for `Traffic generation complete`, stop Wireshark, and save the capture as `challenge.pcap` in the challenge folder.

The script requests **six** resources with short pauses, all on `127.0.0.1:8085`. Ignore the earlier `curl` verification request if it was captured, and isolate the script's six consecutive requests.

### Suggested display filters

```text
tcp.port == 8085
http
http.request
http.response
tcp.flags.syn == 1
```

If HTTP traffic appears only as TCP, select the conversation and use **Analyze → Decode As… → HTTP** for the service port. You can also right-click a packet and choose **Follow → TCP Stream**.

## 5. Answer the questions

Include packet/frame numbers or screenshots to support your responses. The **instructor-only** answer key has specific expected answers.

### A — Identify the conversation (4 points)

| ID | Question | Your answer |
|---|---|---|
| **B05-C1** | What IP address and TCP port does the script contact? | |
| **B05-C2** | Which Kali capture interface shows this local traffic? | |
| **B05-C3** | Which transport and application protocols are used? | |
| **B05-C4** | Which HTTP method is used for every generated request? | |

### B — Reconstruct the requests (3 points)

| ID | Question | Your answer |
|---|---|---|
| **B05-C5** | List the **six HTTP request paths in order**, including the repeated request. | |
| **B05-C6** | How many requests did the script send, and which path appears twice? | |
| **B05-C7** | What HTTP status code do all six requests return if the exercise is prepared correctly? | |

Use the saved PCAP to cross-check:

```bash
tshark -r challenge.pcap -Y http.request -T fields -e frame.number -e http.request.method -e http.request.uri
tshark -r challenge.pcap -Y http.response -T fields -e frame.number -e http.response.code
```

### C — Analyze TCP and runtime evidence (3 points)

| ID | Question | Your answer |
|---|---|---|
| **B05-C8** | What are the three TCP handshake steps/flags, in order? | |
| **B05-C9** | Which HTTP request path delivers the **analysis** evidence response? If your event lead injected a private flag, recover it from the captured response body. | |
| **B05-C10** | Which HTTP request path delivers the **PCAP marker** response? If a private flag was injected, recover it from the captured response body. | |

If you only have the local practice setup, you may see `FLAG_NOT_CONFIGURED` in those two responses. This is enough to answer the **path questions**, but it is not a valid dashboard submission. Ask your event lead for the scored capture.

### D — Verify with tshark (1 point)

| ID | Question | Your answer |
|---|---|---|
| **B05-C11** | Write one `tshark` command that lists only the HTTP requests from `challenge.pcap`. | |

Calculate your own capture hash (it will differ between students):

```bash
sha256sum challenge.pcap
```

## Submission

Copy the answer template below:

```text
B05-C1:
B05-C2:
B05-C3:
B05-C4:
B05-C5:
B05-C6:
B05-C7:
B05-C8:
B05-C9:
B05-C10:
B05-C11:

Evidence frame number(s):
Six-request timeline:
Follow TCP Stream observation:
challenge.pcap SHA-256:
```

**Grading:** 11 questions (1 point each), plus 3 evidence points for a frame/screenshot, stream/timeline, and hash. The two separately injected flags, when available, are submitted to the CyberLabs dashboard for separate credit.

## Cleanup

Stop the Python server in Terminal 1 with **Ctrl+C**. Then, from the challenge folder, remove the temporary files:

```bash
rm -rf site/runtime
rm -f challenge.pcap
```

The generated `site/runtime/` folder is ignored by Git and must **never** be committed or distributed with private instructor values.

## Troubleshooting

- **No packets:** capture on **lo**, not `eth0`; start the capture before `generate-traffic.sh`.
- **HTTP not decoded:** use `tcp.port == 8085` and **Decode As… HTTP**.
- **Connection refused:** check that Terminal 1 is still running.
- **404 on a runtime response:** rerun `bash prepare-flags.sh` in the challenge folder; restart the capture.
- **Dashboard rejects a flag:** `FLAG_NOT_CONFIGURED` is practice-only; the event lead must provide instructor-injected evidence.
- **No permission to capture:** follow Kali's Wireshark/dumpcap permission prompt or ask the event lead for help. **Do not run Wireshark as root** just to open the GUI.
