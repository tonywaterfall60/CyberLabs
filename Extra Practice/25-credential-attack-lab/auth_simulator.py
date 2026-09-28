from http.server import BaseHTTPRequestHandler,HTTPServer
from urllib.parse import parse_qs
import time
USERS={"alice":"password","bob":"password123","carol":"secret","dana":"welcome","erin":"training"}
ATTEMPTS={}
class H(BaseHTTPRequestHandler):
    def do_POST(self):
        if self.path!="/login": self.send_response(404); self.end_headers(); return
        n=int(self.headers.get("Content-Length","0")); d=parse_qs(self.rfile.read(n).decode())
        u=d.get("username",[""])[0]; p=d.get("password",[""])[0]
        now=time.time(); recent=[x for x in ATTEMPTS.get(u,[]) if now-x<30]; recent.append(now); ATTEMPTS[u]=recent
        if len(recent)>3:
            self.send_response(429); self.end_headers(); self.wfile.write(b"rate_limited"); return
        ok=USERS.get(u)==p
        self.send_response(200 if ok else 401); self.end_headers(); self.wfile.write(b"success" if ok else b"invalid")
HTTPServer(("127.0.0.1",8800),H).serve_forever()
