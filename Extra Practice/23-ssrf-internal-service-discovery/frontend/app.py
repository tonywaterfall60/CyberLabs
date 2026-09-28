from flask import Flask,request,jsonify
import requests
app=Flask(__name__)
@app.get("/")
def home(): return jsonify(service="preview",usage="/preview?url=http://internal-api:5001/health")
@app.get("/preview")
def preview():
    url=request.args.get("url","")
    if not url.startswith("http://"):
        return jsonify(error="training lab accepts http URLs only"),400
    try:
        r=requests.get(url,timeout=2)
        return jsonify(status=r.status_code,body=r.text[:2000])
    except Exception as e:
        return jsonify(error=str(e)),502
app.run(host="0.0.0.0",port=5000)
