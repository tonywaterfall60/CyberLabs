import os
from flask import Flask, session, redirect, jsonify, abort

app = Flask(__name__)
app.secret_key = "training-only-secret"

REPORTS = {
    1: {"owner": "alice", "content": "Alice training report"},
    2: {"owner": "bob", "content": "Bob training report"},
}

@app.get("/")
def home():
    return """<h1>Advanced Web Lab</h1>
    <a href='/login/alice'>Login as Alice</a><br>
    <a href='/login/bob'>Login as Bob</a>"""

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
    return f"<h1>{user}</h1><a href='/api/report/{own_id}'>My report</a>"

@app.get("/api/report/<int:report_id>")
def report(report_id):
    user = session.get("user")
    if not user:
        return jsonify(error="authentication required"), 401
    report = REPORTS.get(report_id)
    if not report:
        return jsonify(error="not found"), 404

    body = {"requested_by": user, "owner": report["owner"], "content": report["content"]}
    if user != report["owner"]:
        body["private_event_flag"] = os.getenv("WEB_FLAG_VALUE", "FLAG_NOT_CONFIGURED")
    return jsonify(body)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
