# Challenge — Local Packet Investigation

Start the local web service:

```bash
docker compose up -d
```

Open Wireshark and capture the interface that can see your localhost/Docker traffic.

Generate traffic:

```bash
curl http://127.0.0.1:8085/
curl http://127.0.0.1:8085/status
```

## Tasks

1. Identify the TCP destination port.
2. Find an HTTP GET request for `/`.
3. Find an HTTP GET request for `/status`.
4. Identify the HTTP response status code.
5. Find a TCP packet with the SYN flag.
6. Identify the source and destination IPs visible in your capture.
7. Explain why the capture is safe for this lab.

## Suggested Filters

```text
tcp.port == 8085
http
tcp.flags.syn == 1
```

Depending on your OS and Docker networking, localhost traffic may appear differently. Focus on the request path, port, TCP flags, and protocol relationships.

## Cleanup

```bash
docker compose down
```
