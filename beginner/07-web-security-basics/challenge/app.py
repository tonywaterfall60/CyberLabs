from flask import Flask, jsonify, make_response, request

app = Flask(__name__)

STYLE = "<style>\n:root{color-scheme:dark;--bg:#08111f;--panel:#0f1b2d;--panel2:#14243a;--text:#e8eef8;--muted:#9fb0c7;--accent:#66d9ef;--line:#273a55;--good:#7bd88f;--warn:#f2c14e}\n*{box-sizing:border-box} body{margin:0;background:linear-gradient(180deg,#07101d,#0b1524);color:var(--text);font-family:Inter,ui-sans-serif,system-ui,-apple-system,Segoe UI,sans-serif}\n.wrap{max-width:980px;margin:0 auto;padding:28px 20px 60px}.top{display:flex;justify-content:space-between;align-items:center;padding:14px 0;border-bottom:1px solid var(--line);margin-bottom:28px}\n.brand{font-weight:800;letter-spacing:.08em;text-transform:uppercase}.badge{font-size:.8rem;padding:5px 9px;border:1px solid var(--line);border-radius:999px;color:var(--accent)}\n.hero{padding:28px;background:var(--panel);border:1px solid var(--line);border-radius:16px;margin-bottom:18px}.hero h1{margin:0 0 8px;font-size:2rem}.hero p{color:var(--muted);max-width:760px}\n.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:14px}.card{background:var(--panel2);border:1px solid var(--line);border-radius:12px;padding:18px}.card h2,.card h3{margin-top:0}\na{color:var(--accent);text-decoration:none}a:hover{text-decoration:underline}code{font-family:ui-monospace,SFMono-Regular,Menlo,monospace;background:#091524;border:1px solid var(--line);padding:2px 6px;border-radius:6px}\nnav a{margin-right:14px}.muted{color:var(--muted)}.ok{color:var(--good)}.warn{color:var(--warn)}table{width:100%;border-collapse:collapse}th,td{text-align:left;padding:10px;border-bottom:1px solid var(--line)}\n.footer{margin-top:24px;color:var(--muted);font-size:.9rem;border-top:1px solid var(--line);padding-top:18px}\n</style>"

def page(title, subtitle, body, level="Beginner"):
    return f"""<!doctype html>
<html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>{title} | CyberLabs</title>{STYLE}</head>
<body><div class="wrap">
<div class="top"><div class="brand">CyberLabs</div><div class="badge">{level} · Web Basics</div></div>
<section class="hero"><h1>{title}</h1><p>{subtitle}</p>
<nav><a href="/">Home</a><a href="/about">About</a><a href="/session-demo">Session Demo</a><a href="/api/status">API Status</a><a href="/admin">Admin</a></nav></section>
{body}
<div class="footer">Authorized local training service · SRU Cyber Club CyberLabs</div>
</div></body></html>"""

def tagged(body, status=200, content_type="text/html"):
    resp = make_response(body, status)
    resp.headers["X-CyberLabs-Training"] = "beginner-web"
    resp.headers["X-CyberLabs-Level"] = "beginner"
    resp.headers["X-CyberLabs-Lab"] = "web-basics"
    resp.headers["Content-Type"] = content_type
    return resp

@app.get("/")
def home():
    body = """
<div class="grid">
  <div class="card"><h2>Welcome</h2><p>This portal is intentionally small so you can practice reading routes, status codes, and headers.</p></div>
  <div class="card"><h2>Service</h2><p class="ok">Training service online</p><p><code>/api/status</code> returns machine-readable status data.</p></div>
  <div class="card"><h2>Access Control</h2><p>The <code>/admin</code> route demonstrates a forbidden response.</p></div>
</div>
"""
    resp = tagged(page("Training Portal","Practice normal HTTP behavior before moving into web security testing.",body))
    resp.set_cookie("training_view", "beginner", httponly=True, samesite="Lax")
    return resp

@app.get("/about")
def about():
    body = """
<div class="card">
<h2>About this lab</h2>
<p>This application is part of the Beginner Web Security event. Use browser developer tools and curl to inspect normal requests and responses.</p>
<table><tr><th>Environment</th><td>Local Docker</td></tr><tr><th>Purpose</th><td>HTTP fundamentals</td></tr><tr><th>Authorized target</th><td><code>127.0.0.1:8070</code></td></tr></table>
</div>
"""
    return tagged(page("About CyberLabs","A controlled local application for learning HTTP.",body))

@app.get("/session-demo")
def session_demo():
    cookie_value = request.cookies.get("training_view", "(not present)")
    body = f"""
<div class="grid">
  <div class="card"><h2>Cookie Observation</h2><p>Your request supplied <code>training_view={cookie_value}</code>.</p><p class="muted">This is a simple training cookie, not an authentication token.</p></div>
  <div class="card"><h2>Request Method</h2><p><code>{request.method}</code></p><p class="muted">Use browser developer tools or curl to inspect the Cookie request header.</p></div>
</div>
"""
    return tagged(page("Session & Cookie Demo","See how a server can read a value previously stored by the browser.",body))

@app.get("/api/status")
def status():
    resp = jsonify(service="cyberlabs", status="online", environment="training", level="beginner")
    resp.headers["X-CyberLabs-Training"] = "beginner-web"
    resp.headers["X-CyberLabs-Level"] = "beginner"
    resp.headers["X-CyberLabs-Lab"] = "web-basics"
    return resp

@app.get("/admin")
def admin():
    body = """<div class="card"><h2 class="warn">403 Forbidden</h2><p>You reached the route, but this training user is not authorized to access administrative content.</p><p>Think about the difference between <strong>authentication</strong> and <strong>authorization</strong>.</p></div>"""
    return tagged(page("Administrative Area","This route exists to demonstrate an authorization response.",body),403)

@app.get("/robots.txt")
def robots():
    return tagged("User-agent: *\nDisallow: /admin\n",200,"text/plain")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
