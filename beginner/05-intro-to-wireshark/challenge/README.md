# Challenge — Local Packet Investigation

**Difficulty:** Beginner  
**Estimated time:** 40–55 minutes  
**Target:** `127.0.0.1:8085`

## Scenario

You are given a small local diagnostics service and asked to capture one short session so another analyst can verify what happened on the wire.

Your goal is to identify requests, responses, TCP setup, and a simple sequence of activity—not to inspect unrelated traffic.

## Start the Service

~~~bash
docker compose up -d
~~~

Verify:

~~~bash
curl http://127.0.0.1:8085/
~~~

## Capture Scope

Capture only traffic for:

~~~text
127.0.0.1:8085
~~~

On Kali, loopback traffic normally appears on interface `lo`.

## Generate Repeatable Traffic

Use the included script:

~~~bash
chmod +x generate-traffic.sh
./generate-traffic.sh
~~~

It requests:

~~~text
/
/status
/help
/status
~~~

with short pauses so the sequence is easier to recognize.

## Phase 1 — Wireshark

Useful display filters:

~~~text
tcp.port == 8085
http
http.request
http.response
tcp.flags.syn == 1
~~~

Identify:

1. TCP destination port,
2. client/server IPs,
3. at least one SYN packet,
4. GET `/`,
5. GET `/status`,
6. GET `/help`,
7. HTTP response status codes.

## Phase 2 — Follow a Conversation

Choose one HTTP packet and use **Follow → TCP Stream**.

Record:

~~~text
Request line:
Host header:
Response status:
One response header:
~~~

## Phase 3 — Save Evidence

Save the capture as:

~~~text
challenge.pcap
~~~

Then calculate:

~~~bash
sha256sum challenge.pcap
~~~

This introduces the idea that packet captures are evidence files too.

## Phase 4 — tshark

Show HTTP requests:

~~~bash
tshark -r challenge.pcap -Y http.request -T fields -e frame.number -e http.request.method -e http.request.uri
~~~

Show HTTP responses:

~~~bash
tshark -r challenge.pcap -Y http.response -T fields -e frame.number -e http.response.code
~~~

## Timeline Task

Create:

~~~text
Frame | Method | Path | Response Status | Observation
~~~

Put the requests in order.

## Deliverable

~~~text
Capture interface:
Client IP:
Server IP:
Destination port:
Paths observed:
Response statuses:
One TCP flag:
One request header:
PCAP SHA-256:
Wireshark filter:
tshark command:
Timeline:
~~~

## Cleanup

~~~bash
docker compose down
rm -f challenge.pcap
~~~