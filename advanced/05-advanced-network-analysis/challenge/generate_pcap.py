from scapy.all import Ether, IP, UDP, TCP, DNS, DNSQR, Raw, wrpcap
from pathlib import Path

pkts = []
BASE = 1790344800  # 2026-09-25T14:00:00Z
def runtime_value(name):
    path = Path("runtime") / name
    if not path.exists():
        return "FLAG_NOT_CONFIGURED"
    text = path.read_text(encoding="utf-8").strip()
    return text.split("=", 1)[-1] if "=" in text else text

TIMELINE_FLAG = runtime_value("timeline-note.txt")
HYPOTHESIS_FLAG = runtime_value("hypothesis-note.txt")

def add(pkt, offset):
    pkt.time = BASE + offset
    pkts.append(pkt)

# Normal workstation: DNS + intranet HTTP
add(Ether()/IP(src='10.30.0.10',dst='10.30.0.53')/UDP(sport=53001,dport=53)/DNS(rd=1,qd=DNSQR(qname='intranet.training.local')), 5)
add(Ether()/IP(src='10.30.0.10',dst='10.30.0.20')/TCP(sport=40000,dport=80,flags='PA')/Raw(load=b'GET / HTTP/1.1\r\nHost: intranet.training.local\r\n\r\n'), 9)

# Software-update style traffic from another normal host
add(Ether()/IP(src='10.30.0.11',dst='10.30.0.53')/UDP(sport=53011,dport=53)/DNS(rd=1,qd=DNSQR(qname='updates.training.local')), 30)
add(Ether()/IP(src='10.30.0.11',dst='10.30.0.40')/TCP(sport=41000,dport=443,flags='PA')/Raw(load=b'normal-update-check'), 35)

# Host of interest: DNS associated with recurring telemetry-like traffic
add(Ether()/IP(src='10.30.0.25',dst='10.30.0.53')/UDP(sport=53025,dport=53)/DNS(rd=1,qd=DNSQR(qname='telemetry.training.invalid')), 60)

# Host of interest also accesses an internal application
add(Ether()/IP(src='10.30.0.25',dst='10.30.0.20')/TCP(sport=42000,dport=8080,flags='PA')/Raw(load=b'GET /profile HTTP/1.1\r\nHost: portal.training.local\r\n\r\n'), 72)
add(Ether()/IP(src='10.30.0.25',dst='10.30.0.20')/TCP(sport=42001,dport=8080,flags='PA')/Raw(load=(f'GET /reports/export HTTP/1.1\r\nHost: portal.training.local\r\nX-Timeline-Marker: {TIMELINE_FLAG}\r\n\r\n').encode()), 91)

# Recurring packets every 60 seconds to a documentation-range IP
for i in range(8):
    payload = f'training-heartbeat;analysis={HYPOTHESIS_FLAG if i == 7 else "periodic"}'.encode()
    add(Ether()/IP(src='10.30.0.25',dst='198.51.100.25')/TCP(sport=45000+i,dport=8443,flags='PA')/Raw(load=payload), 120 + (i * 60))

# A second periodic flow with a different interval, to discourage simplistic 'periodic == bad' reasoning
for i in range(4):
    add(Ether()/IP(src='10.30.0.12',dst='10.30.0.60')/TCP(sport=46000+i,dport=9100,flags='PA')/Raw(load=b'printer-status'), 180 + (i * 300))

wrpcap('advanced-network.pcap', pkts)
print(f'[+] Wrote advanced-network.pcap with {len(pkts)} packets')