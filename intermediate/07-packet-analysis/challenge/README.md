# Challenge — Reconstruct the Web Session

Start the local service:

```bash
docker compose up -d
```

Authorized traffic:

```text
127.0.0.1:8300
```

## Kali Tools

Use at least two:

- Wireshark
- tcpdump
- tshark

## Option A — Wireshark

Begin a capture of your own local traffic.

Then run:

```bash
./generate-traffic.sh
```

Useful filters:

```text
tcp.port == 8300
http
http.request
tcp.flags.syn == 1
```

## Option B — tcpdump

Capture the local session:

```bash
sudo tcpdump   -i lo   tcp port 8300   -w session.pcap
```

In another terminal:

```bash
./generate-traffic.sh
```

Stop tcpdump after the requests finish.

Interface names may vary by environment. Use the interface that actually sees your authorized local traffic.

## Option C — tshark

Read the capture:

```bash
tshark -r session.pcap
```

Show HTTP requests:

```bash
tshark   -r session.pcap   -Y http.request   -T fields   -e frame.time   -e ip.src   -e ip.dst   -e http.request.method   -e http.request.uri
```

Show response codes:

```bash
tshark   -r session.pcap   -Y http.response   -T fields   -e frame.time   -e http.response.code
```

## Tasks

1. Identify the destination port.
2. Find requests to `/`, `/login`, `/api/profile`, and `/logout`.
3. Identify the response status for each.
4. Follow at least one TCP stream in Wireshark.
5. Determine the order of application activity.
6. Identify the custom header.
7. Produce the same basic timeline using tshark output.
8. Explain one advantage of Wireshark and one advantage of tshark.

## Deliverable

```text
Timestamp:
Source:
Destination:
Method/path:
Status:
Evidence source (Wireshark/tshark):
Interpretation:
```

## Cleanup

```bash
docker compose down
rm -f session.pcap
```
