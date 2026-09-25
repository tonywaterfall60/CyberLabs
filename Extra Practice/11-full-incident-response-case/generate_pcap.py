import sys
from scapy.all import Ether, IP, UDP, TCP, DNS, DNSQR, Raw, wrpcap

out = sys.argv[1] if len(sys.argv) > 1 else 'incident.pcap'
pkts = []
T = 1761408000

def add(pkt, offset):
    pkt.time = T + offset
    pkts.append(pkt)

add(Ether()/IP(src='10.90.0.17',dst='10.90.0.53')/UDP(sport=53017,dport=53)/DNS(rd=1,qd=DNSQR(qname='sync.training.invalid')), 206)

for i in range(5):
    add(Ether()/IP(src='10.90.0.17',dst='192.0.2.44')/TCP(sport=46000+i,dport=443,flags='PA')/Raw(load=b'training-sync'), 220 + i*60)

add(Ether()/IP(src='10.90.0.17',dst='10.90.0.20')/TCP(sport=47001,dport=8080,flags='PA')/Raw(load=b'GET /employees HTTP/1.1\r\nHost: hr.training.local\r\n\r\n'), 258)
add(Ether()/IP(src='10.90.0.17',dst='10.90.0.20')/TCP(sport=47002,dport=8080,flags='PA')/Raw(load=b'GET /employees/export HTTP/1.1\r\nHost: hr.training.local\r\n\r\n'), 276)

add(Ether()/IP(src='10.90.0.22',dst='10.90.0.53')/UDP(sport=53022,dport=53)/DNS(rd=1,qd=DNSQR(qname='intranet.training.local')), 905)

wrpcap(out, pkts)
print(f'[+] Wrote {out} ({len(pkts)} packets)')