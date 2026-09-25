from http.server import BaseHTTPRequestHandler, HTTPServer
from http.cookies import SimpleCookie
from urllib.parse import urlparse
import json
import os

FLAG = os.getenv("WEB_FLAG_VALUE", "FLAG_NOT_CONFIGURED")

REPORTS = {
    "1": {"owner": "alice", "title": "Quarterly Access Review", "classification": "Internal"},
    "2": {"owner": "bob", "title": "Finance Export Review", "classification": "Confidential Training"},
}

STYLE = """
<style>
:root{color-scheme:dark;--bg:#08111f;--panel:#0f1b2d;--panel2:#14243a;--text:#e8eef8;--muted:#9fb0c7;--accent:#66d9ef;--line:#273a55}
*{box-sizing:border-box}body{margin:0;background:#08111f;color:var(--text);font-family:system-ui}.wrap{max-width:900px;margin:auto;padding:30px 20px}
.top{display:flex;justify-content:space-between;border-bottom:1px solid var(--line);padding-bottom:14px}.card{background:var(--panel);border:1px solid var(--line);border-radius:14px;padding:22px;margin:16px 0}
a{color:var(--accent)}.muted{color:var(--muted)}code{background:#091524;padding:2px 6px;border-radius:6px}
</style>
"""

def page(title, body):
    return f"""<!doctype html><html><head><meta charset="utf-8"><title>{title} | CyberLabs</title>{STYLE}</head>
<body><div class="wrap"><div class="top"><strong>CyberLabs</strong><span>Intermediate CTF</span></div>
<div class="card"><h1>{title}</h1><p><a href="/">Home</a> · <a href="/about">About</a> · <a href="/api/status">API Status</a> · <a href="/dashboard">Dashboard</a></p></div>
{body}<p class="muted">Authorized local target · 127.0.0.1:8440</p></div></body></html>"""

class Handler(BaseHTTPRequestHandler):
    def current_user(self):
        cookie = SimpleCookie(self.headers.get("Cookie"))
        return cookie["ctf_user"].value if "ctf_user" in cookie else None

    def respond(self, status, ctype, body, extra_headers=None):
        self.send_response(status)
        self.send_header("Content-Type", ctype)
        self.send_header("X-CyberLabs-Level", "intermediate")
        self.send_header("X-CyberLabs-Lab", "intermediate-ctf")
        if extra_headers:
            for k, v in extra_headers.items():
                self.send_header(k, v)
        self.end_headers()
        if isinstance(body, str):
            body = body.encode()
        self.wfile.write(body)

    def do_GET(self):
        path = urlparse(self.path).path

        if path == "/":
            body = page("Operations Portal", """<div class="card"><h2>Training Accounts</h2>
<p><a href="/login/alice">Login as Alice</a> · <a href="/login/bob">Login as Bob</a></p>
<p>Establish normal behavior before changing object identifiers.</p></div>""")
            return self.respond(200, "text/html", body)

        if path == "/about":
            return self.respond(200, "text/html", page("About", "<div class='card'><p>Intermediate capstone web target for mapping and authorization analysis.</p></div>"))

        if path == "/api/status":
            return self.respond(200, "application/json", json.dumps({"service":"intermediate-ctf","status":"online","version":"2026.09"}))

        if path == "/robots.txt":
            return self.respond(200, "text/plain", "User-agent: *\nDisallow: /internal/build\n")

        if path == "/internal/build":
            return self.respond(200, "application/json", json.dumps({"framework":"stdlib-http","environment":"training","build":"ctf-2026.09"}))

        if path.startswith("/login/"):
            user = path.split("/", 2)[2]
            if user not in {"alice","bob"}:
                return self.respond(404, "text/plain", "Unknown training user\n")
            return self.respond(302, "text/plain", "Redirecting\n", {
                "Set-Cookie": f"ctf_user={user}; HttpOnly; SameSite=Lax",
                "Location": "/dashboard"
            })

        if path == "/dashboard":
            user = self.current_user()
            if not user:
                return self.respond(401, "text/plain", "Login required\n")
            report_id = "1" if user == "alice" else "2"
            report = REPORTS[report_id]
            body = page(f"{user.title()} Dashboard", f"""<div class="card"><h2>Assigned Report</h2>
<p>{report['title']}</p><p>Object ID: <code>{report_id}</code></p>
<p><a href="/api/report/{report_id}">Open report API</a></p></div>""")
            return self.respond(200, "text/html", body)

        if path.startswith("/api/report/"):
            user = self.current_user()
            if not user:
                return self.respond(401, "application/json", json.dumps({"error":"login required"}))
            report_id = path.rsplit("/", 1)[-1]
            report = REPORTS.get(report_id)
            if not report:
                return self.respond(404, "application/json", json.dumps({"error":"not found"}))
            cross_user = user != report["owner"]
            body = {
                "requested_by": user,
                "report": {"id": report_id, **report},
                "cross_user": cross_user
            }
            if cross_user:
                body["private_event_flag"] = FLAG
            return self.respond(200, "application/json", json.dumps(body))

        return self.respond(404, "text/plain", "Not found\n")

HTTPServer(("0.0.0.0", 8000), Handler).serve_forever()
