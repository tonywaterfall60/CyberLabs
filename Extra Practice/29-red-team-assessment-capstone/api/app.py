import os
from flask import Flask,jsonify,request
app=Flask(__name__)
REPORTS={1:{"owner":"ops","name":"public-summary"},2:{"owner":"executive","name":"protected-assessment"}}
@app.get("/")
def home(): return jsonify(service="assessment-api",routes=["/reports/<id>"])
@app.get("/reports/<int:i>")
def report(i):
    if request.headers.get("X-Assessment-Key")!="range-only-key": return jsonify(error="forbidden"),403
    r=REPORTS.get(i)
    if not r:return jsonify(error="not found"),404
    out={"id":i,**r}
    if i==2:out["objective"]=os.getenv("RED_CAPSTONE_FLAG","FLAG_NOT_CONFIGURED")
    return jsonify(out)
app.run(host="0.0.0.0",port=5000)
