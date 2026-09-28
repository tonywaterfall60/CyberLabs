from flask import Flask,jsonify
app=Flask(__name__)
@app.get("/health")
def health(): return jsonify(status="ok",service="internal-api",docs="/docs")
@app.get("/docs")
def docs(): return jsonify(routes=["/health","/inventory"])
@app.get("/inventory")
def inventory(): return jsonify(service="admin-service",host="admin-service",port=5002,route="/objective")
app.run(host="0.0.0.0",port=5001)
