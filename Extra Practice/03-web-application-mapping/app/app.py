from flask import Flask, request, jsonify, make_response

app = Flask(__name__)

STYLE = """
<style>
:root{color-scheme:dark;--bg:#08111f;--panel:#0f1b2d;--panel2:#14243a;--text:#e8eef8;--muted:#9fb0c7;--accent:#66d9ef;--line:#273a55;--warn:#f2c14e;--good:#7bd88f}
*{box-sizing:border-box}
body{margin:0;background:linear-gradient(180deg,#07101d,#0b1524);color:var(--text);font-family:Inter,system-ui,sans-serif}
.wrap{max-width:980px;margin:auto;padding:28px 20px 60px}
.top{display:flex;justify-content:space-between;align-items:center;border-bottom:1px solid var(--line);padding-bottom:14px;margin-bottom:28px}
.brand{font-weight:800;letter-spacing:.08em;text-transform:uppercase}.badge{color:var(--accent)}
.hero,.card{background:var(--panel);border:1px solid var(--line);border-radius:16px;padding:22px;margin-bottom:16px}
.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:14px}
.card{background:var(--panel2)}
a{color:var(--accent);text-decoration:none}a:hover{text-decoration:underline}
code{background:#091524;border:1px solid var(--line);padding:2px 6px;border-radius:6px}
.muted{color:var(--muted)}.warn{color:var(--warn)}.good{color:var(--good)}
table{width:100%;border-collapse:collapse}th,td{text-align:left;padding:10px;border-bottom:1px solid var(--line)}
input{background:#091524;color:var(--text);border:1px solid var(--line);border-radius:8px;padding:10px;width:70%}
button{background:#183451;color:var(--text);border:1px solid var(--line);border-radius:8px;padding:10px 14px}
</style>
"""

TICKETS = [
    {"id": 101, "owner": "alice", "status": "open", "subject": "VPN access request"},
    {"id": 102, "owner": "bob", "status": "closed", "subject": "Laptop encryption check"},
    {"id": 103, "owner": "sam", "status": "open", "subject": "Reporting portal issue"},
]

def page(title, subtitle, body):
    return f"""<!doctype html>
<html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>{title} | CyberLabs</title>{STYLE}</head>
<body><div class="wrap">
<div class="top"><div class="brand">CyberLabs</div><div class="badge">Extra Practice · Web Mapping</div></div>
<section class="hero"><h1>{title}</h1><p class="muted">{subtitle}</p>
<nav><a href="/">Dashboard</a> · <a href="/about">About</a> · <a href="/search?q=vpn">Search</a> · <a href="/api/status">API Status</a></nav>
</section>
{body}
<p class="muted">Authorized local training service · Map first, test second.</p>
</div></body></html>"""

def html_response(body, status=200):
    r = make_response(body, status)
    r.headers["X-CyberLabs-App"] = "support-portal"
    r.headers["X-CyberLabs-Backend"] = "flask"
    return r

@app.get("/")
def home():
    body = """
<div class="grid">
<div class="card"><h2>Support Queue</h2><p>3 training tickets are currently represented in the API.</p><p><a href="/api/v1/tickets">View ticket API →</a></p></div>
<div class="card"><h2>Search</h2><p>Search support topics using the visible query parameter.</p><form action="/search"><input name="q" value="vpn"><button>Search</button></form></div>
<div class="card"><h2>Service Status</h2><p class="good">Portal online</p><p><a href="/api/status">Open API status →</a></p></div>
</div>
"""
    r = html_response(page("Support Operations Portal","A small internal-style portal for application mapping practice.",body))
    r.set_cookie("portal_view","analyst",httponly=True,samesite="Lax")
    return r

@app.get("/about")
def about():
    body = """
<div class="card"><h2>Application Information</h2>
<table>
<tr><th>Portal</th><td>Support Operations</td></tr>
<tr><th>Environment</th><td>Training</td></tr>
<tr><th>Release</th><td>2026.09</td></tr>
<tr><th>Audience</th><td>Internal support analysts</td></tr>
</table></div>
"""
    return html_response(page("About","Context can help prioritize an application's attack surface.",body))

@app.get("/search")
def search():
    q = request.args.get("q","")
    matches = [t for t in TICKETS if q.lower() in t["subject"].lower() or q.lower() in t["owner"].lower()]
    rows = "".join(f"<tr><td>{t['id']}</td><td>{t['owner']}</td><td>{t['status']}</td><td>{t['subject']}</td></tr>" for t in matches)
    if not rows:
        rows = "<tr><td colspan='4'>No training results</td></tr>"
    body = f"""
<div class="card"><h2>Search</h2><p>Query: <code>{q}</code></p>
<table><tr><th>ID</th><th>Owner</th><th>Status</th><th>Subject</th></tr>{rows}</table>
<p class="muted">Use Burp Repeater to change only the q parameter and compare responses.</p></div>
"""
    return html_response(page("Search Results","Observe how user-controlled query parameters influence normal application behavior.",body))

@app.get("/api/status")
def status():
    r = jsonify(
        service="support-operations",
        environment="training",
        status="online",
        release="2026.09",
        api_version="v1"
    )
    r.headers["X-CyberLabs-App"] = "support-portal"
    r.headers["X-CyberLabs-Backend"] = "flask"
    return r

@app.get("/api/v1/tickets")
def tickets():
    r = jsonify(count=len(TICKETS), tickets=TICKETS)
    r.headers["X-CyberLabs-App"] = "support-portal"
    return r

@app.get("/admin")
def admin():
    body = """
<div class="card"><h2 class="warn">403 Forbidden</h2>
<p>This route exists, but the current training context is not authorized for administrative functions.</p>
<p class="muted">Route existence is attack-surface information, not proof of authorization bypass.</p></div>
"""
    return html_response(page("Administration","Restricted training route.",body),403)

@app.get("/internal/build")
def build_info():
    body = """
<div class="card"><h2>Build Information</h2>
<table>
<tr><th>Environment</th><td>training</td></tr>
<tr><th>Backend</th><td>Flask</td></tr>
<tr><th>Edge</th><td>Nginx reverse proxy</td></tr>
<tr><th>Release</th><td>2026.09</td></tr>
</table>
<p class="muted">This route is intentionally unlinked for discovery practice.</p></div>
"""
    return html_response(page("Build Information","An unlinked informational route.",body))

@app.get("/robots.txt")
def robots():
    return make_response(
        "User-agent: *\nDisallow: /admin\nDisallow: /internal/build\n",
        200,
        {"Content-Type":"text/plain","X-CyberLabs-App":"support-portal"}
    )

if __name__ == "__main__":
    app.run(host="0.0.0.0",port=5000)
