# Challenge — Synthetic Beacon Investigation

Generate:

```bash
python3 generate_pcap.py
```

Output:

```text
advanced-network.pcap
```

## Tasks

1. Identify all IP conversations.
2. Identify DNS queries.
3. Find recurring traffic with a regular interval.
4. Identify the hostname associated with that traffic.
5. Extract timestamps and destination ports with tshark.
6. Build a concise timeline.
7. Explain why periodic traffic alone does not prove malware.
8. Recommend two endpoint or server-side data sources for validation.

## Suggested tshark

```bash
tshark -r advanced-network.pcap -Y dns
tshark -r advanced-network.pcap -q -z conv,ip
```

## Private Flag

No real flag value is committed. The investigation itself is the primary deliverable.
