import json
import os
import uuid
from datetime import datetime, timezone
from flask import Flask, session, redirect, request

app = Flask(__name__)
app.secret_key = os.getenv("SESSION_SECRET", "cyberlabs-ep08-session")
LOG_DIR = os.getenv("LOG_DIR", "/logs")

STYLE = """<style>
:root{color-scheme:dark;--bg:#08111f;--panel:#0f1b2d;--panel2:#14243a;--text:#e8eef8;--muted:#9fb0c7;--accent:#66d9ef;--line:#273a55;--good:#7bd88f}
*{box-sizing:border-box}body{margin:0;background:linear-gradient(180deg,#07101d,#0b1524);color:var(--text);font-family:Inter,system-ui,sans-serif}
.wrap{max-width:980px;margin:auto;padding:28px 20px 60px}.top{display:flex;justify-content:space-between;border-bottom:1px solid var(--line);padding-bottom:14px;margin-bottom:28px}
.brand{font-weight:800;letter-spacing:.08em}.badge,a{color:var(--accent)}.hero,.card{background:var(--panel);border:1px solid var(--line);border-radius:16px;padding:22px;margin-bottom:16px}
.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:14px}.card{background:var(--panel2)}
code{background:#091524;border:1px solid var(--line);padding:2px 6px;border-radius:6px}.muted{color:var(--muted)}.ok{color:var(--good)}
</style>"""

DOCS = {
    "alice": {"id": 301, "title": "Vendor Risk Review"},
    "bob": {"id": 302, "title": "Incident Response Budget"},
}

def write_log(event, **fields):
    os.makedirs(LOG_DIR, exist_ok=True)
    record = {
        "ts": datetime.now(timezone.utc).isoformat(),
        "event": event,
        "remote": request.headers.get("X-Forwarded-For", request.remote_addr),
        "user": session.get("user"),
        "sid": session.get("sid"),
    }
    record.update(fields)
    with open(os.path.join(LOG_DIR, "auth.jsonl"), "a", encoding="utf-8") as f:
        f.write(json.dumps(record) + "\n")

def page(title, subtitle, body):
    user = session.get("user", "guest")
    return f"""<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>{title} | CyberLabs</title>{STYLE}</head><body><div class="wrap">
<div class="top"><div class="brand">CyberLabs</div><div class="badge">Extra Practice · Purple Team</div></div>
<section class="hero"><h1>{title}</h1><p class="muted">{subtitle}</p><p>Identity: <code>{user}</code></p>
<nav><a href="/">Home</a> · <a href="/dashboard">Dashboard</a> · <a href="/api/status">API Status</a> · <a href="/logout">Logout</a></nav></section>
{body}<p class="muted">Authorized local purple-team training environment.</p></div></body></html>"""

@app.after_request
def headers(resp):
    resp.headers["X-CyberLabs-App"] = "ep08-portal"
    resp.headers["X-CyberLabs-Role"] = "portal"
    return resp

@app.get("/")
def home():
    body = """<div class="grid">
<div class="card"><h2>Red Team</h2><p>Establish normal object access, then make one controlled authorization test.</p></div>
<div class="card"><h2>Blue Team</h2><p>Correlate authentication, API, and edge telemetry.</p></div>
<div class="card"><h2>Training Accounts</h2><p><a href="/login/alice">Login as Alice</a><br><a href="/login/bob">Login as Bob</a></p></div>
</div>"""
    return page("Document Review Portal", "One application, two perspectives: offensive validation and defensive visibility.", body)

@app.get("/login/<user>")
def login(user):
    if user not in DOCS:
        return page("Unknown User", "That training identity does not exist.", "<div class='card'><p>Valid users: alice and bob.</p></div>"), 404
    session.clear()
    session["user"] = user
    session["sid"] = "SID-" + uuid.uuid4().hex[:10]
    write_log("login", result="success")
    return redirect("/dashboard")

@app.get("/dashboard")
def dashboard():
    user = session.get("user")
    if not user:
        return redirect("/")
    doc = DOCS[user]
    body = f"""<div class="grid">
<div class="card"><h2>My Assigned Document</h2><p><strong>{doc['title']}</strong></p><p>Object ID: <code>{doc['id']}</code></p><p><a href="/api/document/{doc['id']}">Open document API →</a></p></div>
<div class="card"><h2>Session</h2><p>Session ID: <code>{session.get('sid')}</code></p><p class="muted">Capture the normal API request before modifying anything.</p></div>
</div>"""
    return page(f"{user.title()} Dashboard", "Establish normal authorized behavior first.", body)

@app.get("/logout")
def logout():
    if session.get("user"):
        write_log("logout", result="success")
    session.clear()
    return redirect("/")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
