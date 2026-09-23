import json
import os
from datetime import datetime, timezone
from flask import Flask, session, redirect, jsonify, abort, request

app = Flask(__name__)
app.secret_key = "training-only-capstone"

DOCS = {
    1: {"owner": "alice", "content": "Alice planning document"},
    2: {"owner": "bob", "content": "Bob confidential training document"},
}

LOG_PATH = "/data/app.log"

def log_event(event, **fields):
    os.makedirs("/data", exist_ok=True)
    record = {
        "ts": datetime.now(timezone.utc).isoformat(),
        "event": event,
        "remote": request.remote_addr,
        "user": session.get("user"),
    }
    record.update(fields)
    with open(LOG_PATH, "a", encoding="utf-8") as f:
        f.write(json.dumps(record) + "\n")

@app.get("/")
def home():
    return """<h1>Red Blue Capstone</h1>
    <a href='/login/alice'>Alice</a><br>
    <a href='/login/bob'>Bob</a>"""

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
    return f"<h1>{user}</h1><a href='/api/document/{own_id}'>My document</a>"

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
    log_event("document_access", doc_id=doc_id, owner=doc["owner"], cross_user=cross_user, result="allowed")

    body = {"owner": doc["owner"], "content": doc["content"]}
    if cross_user:
        body["private_event_flag"] = os.getenv("RED_FLAG_VALUE", "FLAG_NOT_CONFIGURED")
    return jsonify(body)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
