import json
import os
from datetime import datetime, timezone
from flask import Flask, jsonify, request

app = Flask(__name__)
LOG_PATH = os.getenv("LOG_PATH", "/logs/telemetry.jsonl")

def write_event(event, **fields):
    os.makedirs(os.path.dirname(LOG_PATH), exist_ok=True)
    record = {
        "ts": datetime.now(timezone.utc).isoformat(),
        "event": event,
        "remote": request.remote_addr,
    }
    record.update(fields)
    with open(LOG_PATH, "a", encoding="utf-8") as f:
        f.write(json.dumps(record) + "\n")

@app.after_request
def headers(resp):
    resp.headers["X-CyberLabs-Lab"] = "multi-host-range"
    resp.headers["X-CyberLabs-Service"] = "telemetry-collector"
    return resp

@app.get("/")
def home():
    write_event("collector_view", path="/")
    return jsonify(service="telemetry-collector", environment="training", status="online")

@app.get("/health")
def health():
    write_event("health_check", path="/health")
    return jsonify(status="ok", queue_depth=0)

@app.post("/ingest")
def ingest():
    data = request.get_json(silent=True) or {}
    write_event(
        "telemetry_ingest",
        path="/ingest",
        source=data.get("source", "unknown"),
        kind=data.get("kind", "unknown"),
        detail=data.get("detail", ""),
    )
    return jsonify(accepted=True), 202

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=9000)
