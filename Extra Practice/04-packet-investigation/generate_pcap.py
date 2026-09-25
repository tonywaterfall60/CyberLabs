from scapy.all import Ether, IP, UDP, TCP, DNS, DNSQR, Raw, wrpcap

pkts = []

def add(pkt, ts):
    pkt.time = ts
    pkts.append(pkt)

T = 1761408000

# Normal DNS + internal portal traffic from analyst workstation.
add(Ether()/IP(src='10.55.0.10', dst='10.55.0.53')/UDP(sport=53010, dport=53)/DNS(rd=1, qd=DNSQR(qname='portal.training.local')), T + 5)
add(Ether()/IP(src='10.55.0.10', dst='10.55.0.20')/TCP(sport=41000, dport=8080, flags='PA')/Raw(load=b'GET /dashboard HTTP/1.1\r\nHost: portal.training.local\r\n\r\n'), T + 8)

# DNS query associated with recurring traffic.
add(Ether()/IP(src='10.55.0.30', dst='10.55.0.53')/UDP(sport=53030, dport=53)/DNS(rd=1, qd=DNSQR(qname='telemetry.training.invalid')), T + 15)

# Synthetic login sequence.
events = [
    (25, b'POST /login HTTP/1.1\r\nHost: portal.training.local\r\n\r\nuser=sam&result=failed'),
    (31, b'POST /login HTTP/1.1\r\nHost: portal.training.local\r\n\r\nuser=sam&result=failed'),
    (38, b'POST /login HTTP/1.1\r\nHost: portal.training.local\r\n\r\nuser=sam&result=success'),
    (44, b'GET /reports/export HTTP/1.1\r\nHost: portal.training.local\r\n\r\n'),
]
for offset, body in events:
    add(Ether()/IP(src='10.55.0.30', dst='10.55.0.20')/TCP(sport=42000 + offset, dport=8080, flags='PA')/Raw(load=body), T + offset)

# Recurring training flow every 45 seconds.
for i in range(7):
    add(Ether()/IP(src='10.55.0.30', dst='10.55.0.99')/TCP(sport=45000 + i, dport=9443, flags='PA')/Raw(load=b'training-telemetry'), T + 60 + (i * 45))

# Unrelated background traffic.
add(Ether()/IP(src='10.55.0.10', dst='10.55.0.53')/UDP(sport=53100, dport=53)/DNS(rd=1, qd=DNSQR(qname='updates.training.local')), T + 75)
add(Ether()/IP(src='10.55.0.10', dst='10.55.0.20')/TCP(sport=43000, dport=8080, flags='PA')/Raw(load=b'GET /help HTTP/1.1\r\nHost: portal.training.local\r\n\r\n'), T + 90)

wrpcap('practice-investigation.pcap', pkts)
print('[+] Wrote practice-investigation.pcap')
print(f'[+] Packets: {len(pkts)}')