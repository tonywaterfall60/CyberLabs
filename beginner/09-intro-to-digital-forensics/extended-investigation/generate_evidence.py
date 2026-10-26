#!/usr/bin/env python3
"""Generate fictional FAT16 forensic evidence locally for CyberLabs 09 (stdlib only)."""
import pathlib, struct, hashlib
ROOT=pathlib.Path(__file__).parent
OUT=ROOT/"evidence"; OUT.mkdir(exist_ok=True)
S=512; N=16384; FATS=64; DATA=1+FATS*2+32
b=bytearray(S*N)
b[:3]=b'\xeb\x3c\x90'; b[3:11]=b'MSWIN4.1'
struct.pack_into('<H',b,11,S); b[13]=1
struct.pack_into('<H',b,14,1);b[16]=2
struct.pack_into('<H',b,17,512);struct.pack_into('<H',b,19,N)
b[21]=0xf8;struct.pack_into('<H',b,22,FATS)
struct.pack_into('<H',b,24,32);struct.pack_into('<H',b,26,64)
b[36]=0x80;b[38]=0x29;struct.pack_into('<I',b,39,0xC0DE0909)
b[43:54]=b'CYBERLABS09';b[54:62]=b'FAT16   ';b[510:512]=b'\x55\xaa'
fat=[0]*(FATS*S//2);fat[0]=0xfff8;fat[1]=0xffff
root=(1+FATS*2)*S;cursor=2
def date(y,m,d):return ((y-1980)<<9)|(m<<5)|d
def time(h,m,s):return (h<<11)|(m<<5)|(s//2)
entries=[]
def put(name,data,day,clock,deleted=False):
 global cursor
 data=data.encode()
 cnt=max(1,(len(data)+S-1)//S);start=cursor
 for k in range(cnt):
  c=cursor;cursor+=1
  if not deleted:fat[c]=c+1 if k<cnt-1 else 0xffff
  fragment=data[k*S:(k+1)*S]
  b[(DATA+c-2)*S:(DATA+c-2)*S+len(fragment)]=fragment
 stem,ext=name.split('.')
 e=bytearray(32);e[:11]=(stem.ljust(8)+ext.ljust(3)).encode();e[11]=0x20
 struct.pack_into('<H',e,22,time(*clock));struct.pack_into('<H',e,24,date(*day))
 struct.pack_into('<H',e,26,start);struct.pack_into('<I',e,28,len(data))
 if deleted:e[0]=0xe5
 entries.append(e)
put('README.TXT',"FIELD DRIVE / CASE CL-09-2026\r\nThis removable drive is fictional training evidence.\r\nRecover the relevant notes, including deleted material.\r\n",(2026,10,15),(9,15,0))
put('REPORT.TXT',"2026-10-15 09:18 analyst received removable media\r\n2026-10-14 16:42 internal export reviewed\r\n2026-10-14 16:56 draft reportedly deleted\r\n",(2026,10,15),(9,18,0))
put('NOTES.TXT',"CASE NOTES\r\nExport: EXPORT.CSV\r\nInvestigative keyword: amber\r\nEvidence marker: SRU{TRACE_THE_EVIDENCE}\r\n",(2026,10,14),(16,42,0))
put('EXPORT.CSV',"time,event,subject\r\n2026-10-14T16:40:00,training_export,amber_project\r\n2026-10-14T16:42:00,reviewed,training_only\r\n2026-10-14T16:51:00,checksum_recorded,complete\r\n",(2026,10,14),(16,51,0))
put('DRAFT.TXT',"DELETED TRAINING DRAFT\r\nRecovered evidence marker: SRU{DELETED_DOES_NOT_MEAN_GONE}\r\nOriginal draft time: 2026-10-14 16:56:00\r\n",(2026,10,14),(16,56,0),True)
for i,e in enumerate(entries):b[root+i*32:root+(i+1)*32]=e
for base in (1,1+FATS):
 for i,x in enumerate(fat):struct.pack_into('<H',b,base*S+2*i,x)
out=OUT/"case09_usb.img";out.write_bytes(b)
sha=hashlib.sha256(b).hexdigest()
(OUT/"SHA256SUMS.txt").write_text(f"{sha}  case09_usb.img\n")
print(f"Generated {out} ({len(b)} bytes) SHA256 {sha}")
