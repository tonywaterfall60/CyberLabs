# Wireless Analysis Mini Cheat Sheet

## Core Concepts

~~~text
SSID  = wireless network name
BSSID = access-point radio identifier
STA   = client station
Beacon = AP advertisement
Probe Request = client discovery request
Probe Response = AP discovery response
Authentication = 802.11 authentication exchange
Association = client joins an AP
RSN = WPA2/WPA3-era security capability information
~~~

## Wireshark Filters

~~~text
wlan
wlan.fc.type == 0
wlan.fc.type_subtype == 0x08
wlan.fc.type_subtype == 0x04
wlan.fc.type_subtype == 0x05
wlan.fc.type_subtype == 0x0b
wlan.fc.type_subtype == 0x00
wlan.fc.type_subtype == 0x01
wlan.addr == 02:aa:bb:cc:dd:01
~~~

## tshark Examples

~~~bash
tshark -r wireless-training.pcap -Y 'wlan.fc.type_subtype == 0x08'

tshark -r wireless-training.pcap \
  -Y 'wlan.fc.type_subtype == 0x08' \
  -T fields -e frame.time_epoch -e wlan.bssid -e wlan.ssid

tshark -r wireless-training.pcap \
  -Y 'wlan.fc.type_subtype == 0x04' \
  -T fields -e frame.time_epoch -e wlan.sa -e wlan.ssid
~~~

## Aircrack-ng

~~~bash
aircrack-ng wireless-training.pcap
~~~

Use Aircrack-ng only for offline inspection of the provided synthetic capture in this lab.

## Evidence Reminder

For each conclusion, record:

~~~text
Observed frame/field:
Interpretation:
What remains unknown:
~~~
