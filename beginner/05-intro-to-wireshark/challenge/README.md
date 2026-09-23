# Challenge — Local Packet Investigation

Start the local web service:

```bash
docker compose up -d
```

Target:

```text
127.0.0.1:8085
```

Open Wireshark and capture the interface that can see your authorized local traffic.

Generate traffic:

```bash
curl http://127.0.0.1:8085/
curl http://127.0.0.1:8085/status
```

## Tasks — Wireshark

1. Identify the TCP destination port.
2. Find an HTTP GET request for `/`.
3. Find an HTTP GET request for `/status`.
4. Identify the HTTP response status code.
5. Find a TCP packet with the SYN flag.
6. Identify source and destination IPs.

Useful filters:

```text
tcp.port == 8085
http
tcp.flags.syn == 1
```

## Kali Tool Follow-Up — tshark

Save a small capture from Wireshark as:

```text
challenge.pcap
```

Then run:

```bash
tshark -r challenge.pcap
```

Show only HTTP requests:

```bash
tshark   -r challenge.pcap   -Y http.request   -T fields   -e http.request.method   -e http.request.uri
```

## Questions

1. Did Wireshark and tshark show the same requests?
2. Which interface is easier for a beginner?
3. Why might an analyst prefer a command-line tool during automation or remote analysis?
4. Why is this packet capture within scope?

## Deliverable

```text
Destination port:
Paths observed:
Response status:
TCP flag:
Wireshark filter used:
tshark command used:
```

## Cleanup

```bash
docker compose down
rm -f challenge.pcap
```
