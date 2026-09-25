import json
import os
import uuid
from datetime import datetime, timezone
from flask import Flask, jsonify, request, session

app = Flask(__name__)
app.secret_key = os.getenv("SESSION_SECRET", "cyberlabs-ep08-session")
LOG_DIR = os.getenv("LOG_DIR", "/logs")

DOCS = {
    301: {"owner": "alice", "title": "Vendor Risk Review", "classification": "Internal", "content": "Training vendor-risk observations for Alice."},
    302: {"owner": "bob", "title": "Incident Response Budget", "classification": "Confidential Training", "content": "Training budget planning data for Bob."},
}

def log_event(event, **fields):
    os.makedirs(LOG_DIR, exist_ok=True)
    record = {
        "ts": datetime.now(timezone.utc).isoformat(),
        "event": event,
        "remote": request.headers.get("X-Forwarded-For", request.remote_addr),
        "user": session.get("user"),
        "sid": session.get("sid"),
    }
    record.update(fields)
    with open(os.path.join(LOG_DIR, "api.jsonl"), "a", encoding="utf-8") as f:
        f.write(json.dumps(record) + "\n")

@app.after_request
def headers(resp):
    resp.headers["X-CyberLabs-App"] = "ep08-api"
    resp.headers["X-CyberLabs-Role"] = "internal-api"
    return resp

@app.get("/api/status")
def status():
    return jsonify(service="document-api", environment="training", status="online", version="v1")

@app.get("/api/document/<int:doc_id>")
def document(doc_id):
    request_id = "REQ-" + uuid.uuid4().hex[:12]
    user = session.get("user")
    sid = session.get("sid")

    if not user:
        log_event("document_access", request_id=request_id, doc_id=doc_id, result="unauthenticated")
        resp = jsonify(error="authentication required", request_id=request_id)
        resp.status_code = 401
        resp.headers["X-Request-ID"] = request_id
        return resp

    doc = DOCS.get(doc_id)
    if not doc:
        log_event("document_access", request_id=request_id, doc_id=doc_id, result="not_found")
        resp = jsonify(error="not found", request_id=request_id)
        resp.status_code = 404
        resp.headers["X-Request-ID"] = request_id
        return resp

    cross_user = user != doc["owner"]

    # Intentional training flaw:
    # ownership is observed and logged, but not enforced before returning the object.
    log_event(
        "document_access",
        request_id=request_id,
        doc_id=doc_id,
        owner=doc["owner"],
        cross_user=cross_user,
        result="allowed",
    )

    body = {
        "request_id": request_id,
        "requested_by": user,
        "session_id": sid,
        "document": {
            "id": doc_id,
            "owner": doc["owner"],
            "title": doc["title"],
            "classification": doc["classification"],
            "content": doc["content"],
        },
    }

    if cross_user:
        body["private_event_flag"] = os.getenv("PURPLE_FLAG_VALUE", "FLAG_NOT_CONFIGURED")

    resp = jsonify(body)
    resp.headers["X-Request-ID"] = request_id
    return resp

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)
