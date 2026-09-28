from flask import Flask,jsonify
app=Flask(__name__)
@app.get("/")
def home(): return jsonify(service="northstar-portal",docs="/ops")
@app.get("/ops")
def ops(): return jsonify(api="http://172.28.29.11:5000",training_header="X-Assessment-Key",key="range-only-key")
app.run(host="0.0.0.0",port=80)
