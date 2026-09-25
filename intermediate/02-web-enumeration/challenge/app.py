from flask import Flask, request, jsonify, make_response

app = Flask(__name__)

STYLE = "<style>\n:root{color-scheme:dark;--bg:#08111f;--panel:#0f1b2d;--panel2:#14243a;--text:#e8eef8;--muted:#9fb0c7;--accent:#66d9ef;--line:#273a55;--good:#7bd88f;--warn:#f2c14e}\n*{box-sizing:border-box} body{margin:0;background:linear-gradient(180deg,#07101d,#0b1524);color:var(--text);font-family:Inter,ui-sans-serif,system-ui,-apple-system,Segoe UI,sans-serif}\n.wrap{max-width:980px;margin:0 auto;padding:28px 20px 60px}.top{display:flex;justify-content:space-between;align-items:center;padding:14px 0;border-bottom:1px solid var(--line);margin-bottom:28px}\n.brand{font-weight:800;letter-spacing:.08em;text-transform:uppercase}.badge{font-size:.8rem;padding:5px 9px;border:1px solid var(--line);border-radius:999px;color:var(--accent)}\n.hero{padding:28px;background:var(--panel);border:1px solid var(--line);border-radius:16px;margin-bottom:18px}.hero h1{margin:0 0 8px;font-size:2rem}.hero p{color:var(--muted);max-width:760px}\n.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:14px}.card{background:var(--panel2);border:1px solid var(--line);border-radius:12px;padding:18px}.card h2,.card h3{margin-top:0}\na{color:var(--accent);text-decoration:none}a:hover{text-decoration:underline}code{font-family:ui-monospace,SFMono-Regular,Menlo,monospace;background:#091524;border:1px solid var(--line);padding:2px 6px;border-radius:6px}\nnav a{margin-right:14px}.muted{color:var(--muted)}.ok{color:var(--good)}.warn{color:var(--warn)}table{width:100%;border-collapse:collapse}th,td{text-align:left;padding:10px;border-bottom:1px solid var(--line)}\n.footer{margin-top:24px;color:var(--muted);font-size:.9rem;border-top:1px solid var(--line);padding-top:18px}\n</style>"

def page(title, subtitle, body):
    return f"""<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>{title} | CyberLabs</title>{STYLE}</head><body><div class="wrap">
<div class="top"><div class="brand">CyberLabs</div><div class="badge">Intermediate · Web Enumeration</div></div>
<section class="hero"><h1>{title}</h1><p>{subtitle}</p>
<nav><a href="/">Dashboard</a><a href="/about">About</a><a href="/search?q=training">Search</a><a href="/api/status">API</a></nav></section>
{body}<div class="footer">Authorized local training service · Map first, test second.</div></div></body></html>"""

def resp(body, status=200, content_type="text/html"):
    r = make_response(body, status)
    r.headers["X-CyberLabs-App"] = "intermediate-enum"
    r.headers["X-CyberLabs-Level"] = "intermediate"
    r.headers["X-CyberLabs-Lab"] = "web-enumeration"
    r.headers["Content-Type"] = content_type
    return r

@app.get("/")
def home():
    body = """
<div class="grid">
<div class="card"><h2>Application Map</h2><p>Browse normally first. Record routes, methods, parameters, cookies, and response codes.</p></div>
<div class="card"><h2>Search</h2><p>Try the query parameter at <code>/search?q=training</code> and observe it in Burp.</p></div>
<div class="card"><h2>API</h2><p>The application exposes a small JSON status endpoint at <code>/api/status</code>.</p></div>
</div>
"""
    r = resp(page("Operations Portal","A realistic training portal for route discovery and request mapping.",body))
    r.set_cookie("session_hint","guest",httponly=True,samesite="Lax")
    return r

@app.get("/about")
def about():
    body = """<div class="card"><h2>Environment</h2><table>
<tr><th>Application</th><td>CyberLabs Operations Portal</td></tr>
<tr><th>Build</th><td>Intermediate training</td></tr>
<tr><th>Scope</th><td><code>127.0.0.1:8200</code></td></tr>
</table></div>"""
    return resp(page("About","Application context can help you prioritize what to enumerate.",body))

@app.get("/search")
def search():
    q = request.args.get("q","")
    body = f"""<div class="card"><h2>Search Results</h2><p>Query value received: <code>{q}</code></p><p class="muted">Send this request to Burp Repeater and change one parameter at a time.</p></div>"""
    return resp(page("Search","Observe how query parameters travel from the browser to the server.",body))

@app.get("/api/status")
def status():
    r = jsonify(service="cyberlabs-operations", status="online", role="training", build="intermediate", api_version="v1")
    r.headers["X-CyberLabs-App"] = "intermediate-enum"
    r.headers["X-CyberLabs-Level"] = "intermediate"
    r.headers["X-CyberLabs-Lab"] = "web-enumeration"
    return r

@app.get("/admin")
def admin():
    body = """<div class="card"><h2 class="warn">Restricted Administration</h2><p>Your current training session is not authorized for administrative functions.</p></div>"""
    return resp(page("Admin","A restricted route discovered during application mapping.",body),403)

@app.get("/robots.txt")
def robots():
    return resp("User-agent: *\nDisallow: /admin\nDisallow: /debug-info\n",200,"text/plain")

@app.get("/debug-info")
def debug_info():
    body = """<div class="card"><h2>Debug Information</h2>
<table><tr><th>Environment</th><td>training</td></tr><tr><th>Build</th><td>intermediate</td></tr><tr><th>Feature</th><td>enumeration-lab</td></tr></table>
<p class="muted">An unlinked route is additional attack surface; it is not automatically a vulnerability.</p></div>"""
    return resp(page("Debug Information","A route intended to be discovered through enumeration.",body))

if __name__ == "__main__":
    app.run(host="0.0.0.0",port=5000)
