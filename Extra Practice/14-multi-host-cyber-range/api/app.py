import json
import os
from datetime import datetime, timezone
from flask import Flask, jsonify, request

app = Flask(__name__)
LOG_PATH = os.getenv("LOG_PATH", "/logs/api.jsonl")

CUSTOMERS = [
    {"id": 1001, "name": "Northstar Manufacturing", "tier": "standard"},
    {"id": 1002, "name": "Lakeview Research", "tier": "restricted"},
]

def log_event(event, **fields):
    os.makedirs(os.path.dirname(LOG_PATH), exist_ok=True)
    record = {
        "ts": datetime.now(timezone.utc).isoformat(),
        "event": event,
        "remote": request.remote_addr,
        "path": request.path,
        "method": request.method,
    }
    record.update(fields)
    with open(LOG_PATH, "a", encoding="utf-8") as f:
        f.write(json.dumps(record) + "\n")

@app.after_request
def headers(resp):
    resp.headers["X-CyberLabs-Lab"] = "multi-host-range"
    resp.headers["X-CyberLabs-Service"] = "internal-api"
    return resp

@app.get("/")
def home():
    log_event("api_home", result="allowed")
    return jsonify(service="customer-api", environment="training", version="v1")

@app.get("/api/status")
def status():
    log_event("status", result="allowed")
    return jsonify(service="customer-api", status="online", database="connected")

@app.get("/api/customers")
def customers():
    log_event("customer_list", result="allowed", object_count=len(CUSTOMERS))
    return jsonify(customers=CUSTOMERS)

@app.get("/api/debug")
def debug():
    log_event("debug_access", result="allowed", disclosure="build-metadata")
    return jsonify(
        environment="training",
        build="api-2026.09",
        database_host="db.internal.training",
        queue="jobs.internal.training",
        feature_flags=["reporting", "bulk-export"],
    )

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
