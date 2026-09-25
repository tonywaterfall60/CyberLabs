import json
import os
import uuid
from datetime import datetime, timezone
from flask import Flask, session, redirect, jsonify, abort, request

app = Flask(__name__)
app.secret_key = "training-only-capstone"

STYLE = "<style>\n:root{color-scheme:dark;--bg:#08111f;--panel:#0f1b2d;--panel2:#14243a;--text:#e8eef8;--muted:#9fb0c7;--accent:#66d9ef;--line:#273a55;--good:#7bd88f;--warn:#f2c14e}\n*{box-sizing:border-box} body{margin:0;background:linear-gradient(180deg,#07101d,#0b1524);color:var(--text);font-family:Inter,ui-sans-serif,system-ui,-apple-system,Segoe UI,sans-serif}\n.wrap{max-width:980px;margin:0 auto;padding:28px 20px 60px}.top{display:flex;justify-content:space-between;align-items:center;padding:14px 0;border-bottom:1px solid var(--line);margin-bottom:28px}\n.brand{font-weight:800;letter-spacing:.08em;text-transform:uppercase}.badge{font-size:.8rem;padding:5px 9px;border:1px solid var(--line);border-radius:999px;color:var(--accent)}\n.hero{padding:28px;background:var(--panel);border:1px solid var(--line);border-radius:16px;margin-bottom:18px}.hero h1{margin:0 0 8px;font-size:2rem}.hero p{color:var(--muted);max-width:760px}\n.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:14px}.card{background:var(--panel2);border:1px solid var(--line);border-radius:12px;padding:18px}.card h2,.card h3{margin-top:0}\na{color:var(--accent);text-decoration:none}a:hover{text-decoration:underline}code{font-family:ui-monospace,SFMono-Regular,Menlo,monospace;background:#091524;border:1px solid var(--line);padding:2px 6px;border-radius:6px}\nnav a{margin-right:14px}.muted{color:var(--muted)}.ok{color:var(--good)}.warn{color:var(--warn)}table{width:100%;border-collapse:collapse}th,td{text-align:left;padding:10px;border-bottom:1px solid var(--line)}\n.footer{margin-top:24px;color:var(--muted);font-size:.9rem;border-top:1px solid var(--line);padding-top:18px}\n</style>"

DOCS = {
    1: {"owner": "alice", "title": "Incident Readiness Plan", "classification": "Internal", "content": "Alice planning document"},
    2: {"owner": "bob", "title": "Detection Coverage Review", "classification": "Confidential Training", "content": "Bob confidential training document"},
}

LOG_PATH = "/data/app.log"

def page(title, subtitle, body):
    user = session.get("user")
    identity = user if user else "guest"
    return f"""<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>{title} | CyberLabs</title>{STYLE}</head><body><div class="wrap">
<div class="top"><div class="brand">CyberLabs</div><div class="badge">Advanced · Red vs Blue</div></div>
<section class="hero"><h1>{title}</h1><p>{subtitle}</p><p class="muted">Current identity: <code>{identity}</code></p>
<nav><a href="/">Home</a><a href="/dashboard">Dashboard</a></nav></section>
{body}<div class="footer">Authorized capstone service · Every document access produces defensive telemetry.</div></div></body></html>"""

def log_event(event, **fields):
    os.makedirs("/data", exist_ok=True)
    request_id = "REQ-" + uuid.uuid4().hex[:10]
    record = {
        "ts": datetime.now(timezone.utc).isoformat(),
        "event": event,
        "request_id": request_id,
        "remote": request.headers.get("X-Forwarded-For", request.remote_addr),
        "user": session.get("user"),
        "path": request.path,
        "method": request.method,
        "user_agent": request.headers.get("User-Agent", ""),
    }
    record.update(fields)
    with open(LOG_PATH, "a", encoding="utf-8") as f:
        f.write(json.dumps(record) + "\n")
    return request_id

@app.after_request
def headers(resp):
    resp.headers["X-CyberLabs-Level"] = "advanced"
    resp.headers["X-CyberLabs-Lab"] = "red-blue-capstone"
    return resp

@app.get("/")
def home():
    body = """<div class="grid">
<div class="card"><h2>Red Team</h2><p>Establish normal behavior, capture requests, then test object authorization with minimal changes.</p></div>
<div class="card"><h2>Blue Team</h2><p>Monitor structured application telemetry and identify cross-user access.</p></div>
<div class="card"><h2>Training Accounts</h2><p><a href="/login/alice">Login as Alice</a><br><a href="/login/bob">Login as Bob</a></p></div>
</div>"""
    return page("Document Operations Portal","A shared red/blue application where offensive actions create defensive evidence.",body)

@app.get("/login/<user>")
def login(user):
    if user not in {"alice","bob"}:
        abort(404)
    session["user"] = user
    log_event("login", login_user=user)
    return redirect("/dashboard")

@app.get("/dashboard")
def dashboard():
    user = session.get("user")
    if not user:
        return redirect("/")
    own_id = 1 if user == "alice" else 2
    doc = DOCS[own_id]
    body = f"""<div class="grid">
<div class="card"><h2>My Document</h2><p><strong>{doc['title']}</strong></p><p>Classification: {doc['classification']}</p><a href="/api/document/{own_id}">Open document API →</a></div>
<div class="card"><h2>Telemetry</h2><p>Every document request records user, object ID, owner, cross-user status, result, and timestamp.</p></div>
</div>"""
    return page(f"{user.title()} Dashboard","Establish the normal baseline before changing a request.",body)

@app.get("/api/document/<int:doc_id>")
def document(doc_id):
    user = session.get("user")
    if not user:
        log_event("document_access", doc_id=doc_id, result="unauthenticated")
        return jsonify(error="login required"), 401

    doc = DOCS.get(doc_id)
    if not doc:
        log_event("document_access", doc_id=doc_id, result="not_found")
        return jsonify(error="not found"), 404

    cross_user = user != doc["owner"]
    request_id = log_event(
        "document_access",
        doc_id=doc_id,
        owner=doc["owner"],
        cross_user=cross_user,
        result="allowed"
    )

    body = {
        "request_id": request_id,
        "owner": doc["owner"],
        "title": doc["title"],
        "classification": doc["classification"],
        "content": doc["content"]
    }
    if cross_user:
        body["private_event_flag"] = os.getenv("RED_FLAG_VALUE", "FLAG_NOT_CONFIGURED")
    response = jsonify(body)
    response.headers["X-Request-ID"] = request_id
    return response

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
