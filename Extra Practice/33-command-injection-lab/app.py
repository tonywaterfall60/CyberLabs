import subprocess
from flask import Flask,request,jsonify
app=Flask(__name__)
@app.get("/")
def home(): return jsonify(service="diagnostics",route="/check?name=localhost")
@app.get("/check")
def check():
    name=request.args.get("name","")
    cmd=f"echo checking {name}"
    p=subprocess.run(cmd,shell=True,capture_output=True,text=True,timeout=2)
    return jsonify(command=cmd,stdout=p.stdout,stderr=p.stderr,returncode=p.returncode)
app.run(host="0.0.0.0",port=5000)
