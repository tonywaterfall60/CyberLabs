from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import os

FLAG = os.getenv("WEB_FLAG_VALUE", "FLAG_NOT_CONFIGURED")

STYLE = """
<style>
:root{color-scheme:dark;--bg:#08111f;--panel:#0f1b2d;--panel2:#14243a;--text:#e8eef8;--muted:#9fb0c7;--accent:#66d9ef;--line:#273a55;--warn:#f2c14e}
*{box-sizing:border-box}body{margin:0;background:#08111f;color:var(--text);font-family:Inter,system-ui,sans-serif}
.wrap{max-width:920px;margin:auto;padding:30px 20px}.top{display:flex;justify-content:space-between;border-bottom:1px solid var(--line);padding-bottom:14px;margin-bottom:24px}
.brand{font-weight:800;letter-spacing:.08em}.badge,a{color:var(--accent)}.hero,.card{background:var(--panel);border:1px solid var(--line);border-radius:14px;padding:22px;margin-bottom:14px}
.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(210px,1fr));gap:14px}.card{background:var(--panel2)}
code{background:#091524;border:1px solid var(--line);padding:2px 6px;border-radius:6px}.muted{color:var(--muted)}.warn{color:var(--warn)}
</style>
"""

def page(title, subtitle, body):
    return f"""<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>{title} | CyberLabs</title>{STYLE}</head><body><div class="wrap">
<div class="top"><div class="brand">CyberLabs</div><div class="badge">Beginner · CTF</div></div>
<section class="hero"><h1>{title}</h1><p class="muted">{subtitle}</p>
<nav><a href="/">Home</a> · <a href="/about">About</a> · <a href="/api/status">API Status</a> · <a href="/robots.txt">robots.txt</a></nav></section>
{body}<p class="muted">Authorized local training service · 127.0.0.1:8090</p></div></body></html>"""

class Handler(BaseHTTPRequestHandler):
    def respond(self, status, ctype, body):
        self.send_response(status)
        self.send_header("Content-Type", ctype)
        self.send_header("X-CyberLabs-Training", "beginner-ctf")
        self.send_header("X-CyberLabs-Level", "beginner")
        self.send_header("X-CyberLabs-Lab", "beginner-ctf")
        self.end_headers()
        if isinstance(body, str):
            body = body.encode()
        self.wfile.write(body)

    def do_GET(self):
        if self.path == "/robots.txt":
            self.respond(200, "text/plain", "User-agent: *\nDisallow: /training-admin\n")
            return

        if self.path == "/training-admin":
            body = "Private event flag: " + FLAG + "\n"
            self.respond(200, "text/plain", body)
            return

        if self.path == "/api/status":
            body = json.dumps({
                "service": "beginner-ctf",
                "status": "online",
                "environment": "training",
                "port": 8090
            })
            self.respond(200, "application/json", body)
            return

        if self.path == "/about":
            body = page(
                "About the CTF",
                "A final Beginner environment combining web, Nmap, packet analysis, and evidence handling.",
                """<div class="card"><h2>Scope</h2><p><code>127.0.0.1:8090</code></p>
                <p>This application intentionally exposes several normal routes so students can practice mapping, headers, content types, and robots.txt.</p></div>"""
            )
            self.respond(200, "text/html", body)
            return

        if self.path == "/":
            body = page(
                "Beginner CTF Operations Portal",
                "Use the skills from the full Beginner track to document this local service.",
                """<div class="grid">
                <div class="card"><h2>Web Mapping</h2><p>Inspect status codes, content types, headers, and supporting routes.</p></div>
                <div class="card"><h2>Service Validation</h2><p>Discover the port with Nmap, then validate the application manually.</p></div>
                <div class="card"><h2>Packet Analysis</h2><p>Capture only your own local requests to this service.</p></div>
                </div>"""
            )
            self.respond(200, "text/html", body)
            return

        self.respond(404, "text/plain", "Not found\n")

HTTPServer(("0.0.0.0", 8000), Handler).serve_forever()
