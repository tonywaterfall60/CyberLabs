from scapy.all import (
    RadioTap, Dot11, Dot11Beacon, Dot11ProbeReq, Dot11ProbeResp,
    Dot11Elt, Dot11Auth, Dot11AssoReq, Dot11AssoResp, wrpcap
)

packets = []
BASE = 1790625600  # synthetic timeline

def add(pkt, offset):
    pkt.time = BASE + offset
    packets.append(pkt)

def rsn_element():
    # Minimal WPA2/RSN information element for offline identification.
    return Dot11Elt(ID=48, info=bytes.fromhex(
        "0100000fac040100000fac040100000fac020000"
    ))

def beacon(bssid, ssid, channel, protected=True):
    cap = "ESS+privacy" if protected else "ESS"
    pkt = (
        RadioTap()
        / Dot11(
            type=0, subtype=8,
            addr1="ff:ff:ff:ff:ff:ff",
            addr2=bssid,
            addr3=bssid
        )
        / Dot11Beacon(cap=cap)
        / Dot11Elt(ID="SSID", info=ssid.encode())
        / Dot11Elt(ID="Rates", info=b"\x82\x84\x8b\x96\x0c\x12\x18\x24")
        / Dot11Elt(ID="DSset", info=bytes([channel]))
    )
    if protected:
        pkt = pkt / rsn_element()
    return pkt

def probe_response(bssid, client, ssid, channel, protected=True):
    cap = "ESS+privacy" if protected else "ESS"
    pkt = (
        RadioTap()
        / Dot11(
            type=0, subtype=5,
            addr1=client,
            addr2=bssid,
            addr3=bssid
        )
        / Dot11ProbeResp(cap=cap)
        / Dot11Elt(ID="SSID", info=ssid.encode())
        / Dot11Elt(ID="Rates", info=b"\x82\x84\x8b\x96\x0c\x12\x18\x24")
        / Dot11Elt(ID="DSset", info=bytes([channel]))
    )
    if protected:
        pkt = pkt / rsn_element()
    return pkt

aps = [
    ("02:11:22:33:44:10", "CyberLabs-Staff", 6, True),
    ("02:11:22:33:44:20", "CyberLabs-Guest", 11, False),
    ("02:11:22:33:44:30", "CyberLabs-IoT", 1, True),
]

offset = 0
for _ in range(5):
    for bssid, ssid, channel, protected in aps:
        add(beacon(bssid, ssid, channel, protected), offset)
        offset += 1

client = "02:aa:bb:cc:dd:01"
staff_bssid = "02:11:22:33:44:10"

# Broadcast probe.
add(
    RadioTap()
    / Dot11(
        type=0, subtype=4,
        addr1="ff:ff:ff:ff:ff:ff",
        addr2=client,
        addr3="ff:ff:ff:ff:ff:ff"
    )
    / Dot11ProbeReq()
    / Dot11Elt(ID="SSID", info=b""),
    30,
)

# Directed probe for the fictional staff network.
add(
    RadioTap()
    / Dot11(
        type=0, subtype=4,
        addr1="ff:ff:ff:ff:ff:ff",
        addr2=client,
        addr3="ff:ff:ff:ff:ff:ff"
    )
    / Dot11ProbeReq()
    / Dot11Elt(ID="SSID", info=b"CyberLabs-Staff"),
    32,
)

add(probe_response(staff_bssid, client, "CyberLabs-Staff", 6, True), 34)

# Open-system 802.11 authentication exchange.
add(
    RadioTap()
    / Dot11(type=0, subtype=11, addr1=staff_bssid, addr2=client, addr3=staff_bssid)
    / Dot11Auth(algo=0, seqnum=1, status=0),
    40,
)
add(
    RadioTap()
    / Dot11(type=0, subtype=11, addr1=client, addr2=staff_bssid, addr3=staff_bssid)
    / Dot11Auth(algo=0, seqnum=2, status=0),
    41,
)

# Association exchange.
add(
    RadioTap()
    / Dot11(type=0, subtype=0, addr1=staff_bssid, addr2=client, addr3=staff_bssid)
    / Dot11AssoReq(cap="ESS+privacy", listen_interval=10)
    / Dot11Elt(ID="SSID", info=b"CyberLabs-Staff")
    / rsn_element(),
    45,
)
add(
    RadioTap()
    / Dot11(type=0, subtype=1, addr1=client, addr2=staff_bssid, addr3=staff_bssid)
    / Dot11AssoResp(cap="ESS+privacy", status=0, AID=1),
    46,
)

wrpcap("wireless-training.pcap", packets)
print(f"[+] Wrote wireless-training.pcap with {len(packets)} synthetic 802.11 frames")
