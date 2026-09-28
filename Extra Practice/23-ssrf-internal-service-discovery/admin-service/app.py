import os
from flask import Flask,jsonify
app=Flask(__name__)
@app.get("/")
def home(): return jsonify(service="admin-service",classification="internal-training")
@app.get("/objective")
def objective(): return jsonify(objective=os.getenv("SSRF_FLAG_VALUE","FLAG_NOT_CONFIGURED"))
app.run(host="0.0.0.0",port=5002)
