import os
from flask import Flask, session, redirect, jsonify, abort

app = Flask(__name__)
app.secret_key = "training-only-secret"

STYLE = "<style>\n:root{color-scheme:dark;--bg:#08111f;--panel:#0f1b2d;--panel2:#14243a;--text:#e8eef8;--muted:#9fb0c7;--accent:#66d9ef;--line:#273a55;--good:#7bd88f;--warn:#f2c14e}\n*{box-sizing:border-box} body{margin:0;background:linear-gradient(180deg,#07101d,#0b1524);color:var(--text);font-family:Inter,ui-sans-serif,system-ui,-apple-system,Segoe UI,sans-serif}\n.wrap{max-width:980px;margin:0 auto;padding:28px 20px 60px}.top{display:flex;justify-content:space-between;align-items:center;padding:14px 0;border-bottom:1px solid var(--line);margin-bottom:28px}\n.brand{font-weight:800;letter-spacing:.08em;text-transform:uppercase}.badge{font-size:.8rem;padding:5px 9px;border:1px solid var(--line);border-radius:999px;color:var(--accent)}\n.hero{padding:28px;background:var(--panel);border:1px solid var(--line);border-radius:16px;margin-bottom:18px}.hero h1{margin:0 0 8px;font-size:2rem}.hero p{color:var(--muted);max-width:760px}\n.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:14px}.card{background:var(--panel2);border:1px solid var(--line);border-radius:12px;padding:18px}.card h2,.card h3{margin-top:0}\na{color:var(--accent);text-decoration:none}a:hover{text-decoration:underline}code{font-family:ui-monospace,SFMono-Regular,Menlo,monospace;background:#091524;border:1px solid var(--line);padding:2px 6px;border-radius:6px}\nnav a{margin-right:14px}.muted{color:var(--muted)}.ok{color:var(--good)}.warn{color:var(--warn)}table{width:100%;border-collapse:collapse}th,td{text-align:left;padding:10px;border-bottom:1px solid var(--line)}\n.footer{margin-top:24px;color:var(--muted);font-size:.9rem;border-top:1px solid var(--line);padding-top:18px}\n</style>"

REPORTS = {
    1: {"owner": "alice", "title": "Quarterly Access Review", "classification": "Internal", "content": "Alice training report"},
    2: {"owner": "bob", "title": "Infrastructure Risk Summary", "classification": "Confidential Training", "content": "Bob training report"},
}

def page(title, subtitle, body):
    user = session.get("user")
    identity = user if user else "guest"
    return f"""<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>{title} | CyberLabs</title>{STYLE}</head><body><div class="wrap">
<div class="top"><div class="brand">CyberLabs</div><div class="badge">Advanced · Web Security</div></div>
<section class="hero"><h1>{title}</h1><p>{subtitle}</p><p class="muted">Current identity: <code>{identity}</code></p>
<nav><a href="/">Home</a><a href="/dashboard">Dashboard</a></nav></section>
{body}<div class="footer">Authorized local training service · Validate authorization server-side.</div></div></body></html>"""

@app.after_request
def headers(resp):
    resp.headers["X-CyberLabs-Level"] = "advanced"
    resp.headers["X-CyberLabs-Lab"] = "broken-access-control"
    return resp

@app.get("/")
def home():
    body = """<div class="grid">
<div class="card"><h2>Alice</h2><p>Analyst account with access to report 1.</p><a href="/login/alice">Login as Alice →</a></div>
<div class="card"><h2>Bob</h2><p>Operations account with access to report 2.</p><a href="/login/bob">Login as Bob →</a></div>
<div class="card"><h2>Objective</h2><p>Establish normal access first, then evaluate whether object ownership is enforced.</p></div>
</div>"""
    return page("Secure Reports Portal","A controlled application for analyzing authentication and object-level authorization.",body)

@app.get("/login/<user>")
def login(user):
    if user not in {"alice","bob"}:
        abort(404)
    session["user"] = user
    return redirect("/dashboard")

@app.get("/dashboard")
def dashboard():
    user = session.get("user")
    if not user:
        return redirect("/")
    own_id = 1 if user == "alice" else 2
    report = REPORTS[own_id]
    body = f"""<div class="grid">
<div class="card"><h2>My Assigned Report</h2><p><strong>{report['title']}</strong></p><p>Classification: {report['classification']}</p><a href="/api/report/{own_id}">Open report API →</a></div>
<div class="card"><h2>Session</h2><p>Authenticated as <code>{user}</code>.</p><p class="muted">Use Burp Repeater to test whether authorization is enforced when object identifiers change.</p></div>
</div>"""
    return page(f"{user.title()} Dashboard","Review your normal authorized access before modifying requests.",body)

@app.get("/api/report/<int:report_id>")
def report(report_id):
    user = session.get("user")
    if not user:
        return jsonify(error="authentication required"), 401
    report = REPORTS.get(report_id)
    if not report:
        return jsonify(error="not found"), 404

    body = {"requested_by": user, "owner": report["owner"], "title": report["title"], "classification": report["classification"], "content": report["content"]}
    if user != report["owner"]:
        body["private_event_flag"] = os.getenv("WEB_FLAG_VALUE", "FLAG_NOT_CONFIGURED")
    return jsonify(body)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
