from scapy.all import Ether, IP, UDP, TCP, DNS, DNSQR, Raw, wrpcap

pkts = []

# DNS lookup for normal site
pkts.append(Ether()/IP(src="10.30.0.10",dst="10.30.0.53")/UDP(sport=53001,dport=53)/DNS(rd=1,qd=DNSQR(qname="intranet.training.local")))

# DNS lookup associated with recurring traffic
pkts.append(Ether()/IP(src="10.30.0.25",dst="10.30.0.53")/UDP(sport=53002,dport=53)/DNS(rd=1,qd=DNSQR(qname="telemetry.training.invalid")))

# Normal HTTP-like traffic
pkts.append(Ether()/IP(src="10.30.0.10",dst="10.30.0.20")/TCP(sport=40000,dport=80,flags="PA")/Raw(load=b"GET / HTTP/1.1\r\nHost: intranet.training.local\r\n\r\n"))

# Synthetic recurring beacon-like packets.
for i in range(6):
    p = Ether()/IP(src="10.30.0.25",dst="10.30.0.99")/TCP(sport=45000+i,dport=8443,flags="PA")/Raw(load=b"training-heartbeat")
    p.time = 1700000000 + (i * 60)
    pkts.append(p)

wrpcap("advanced-network.pcap", pkts)
print("[+] Wrote advanced-network.pcap")
