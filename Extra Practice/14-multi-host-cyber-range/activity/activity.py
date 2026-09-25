import json
import time
import urllib.request

def get(url):
    try:
        with urllib.request.urlopen(url, timeout=3) as r:
            r.read()
    except Exception:
        pass

def post_json(url, obj):
    data = json.dumps(obj).encode()
    req = urllib.request.Request(
        url,
        data=data,
        headers={"Content-Type": "application/json"},
        method="POST",
    )
    try:
        with urllib.request.urlopen(req, timeout=3) as r:
            r.read()
    except Exception:
        pass

time.sleep(4)

# Normal service checks.
get("http://172.28.14.10/")
get("http://172.28.14.11:5000/api/status")
get("http://172.28.14.13:9000/health")

# Normal API use.
get("http://172.28.14.11:5000/api/customers")

# Higher-interest information-disclosure access.
get("http://172.28.14.11:5000/api/debug")
get("http://172.28.14.11:5000/api/debug")

# Administrative page observation.
get("http://172.28.14.12:8080/")

# Telemetry events.
post_json(
    "http://172.28.14.13:9000/ingest",
    {"source": "web-01", "kind": "health", "detail": "frontend online"},
)
post_json(
    "http://172.28.14.13:9000/ingest",
    {"source": "api-01", "kind": "debug-route-access", "detail": "/api/debug requested repeatedly"},
)

print("[+] Training activity generation complete.")
