import json,os,time,uuid
from pathlib import Path
from flask import Flask,request,jsonify
app=Flask(__name__)
Path("runtime").mkdir(exist_ok=True)
TOKENS={"alice-token":"alice","bob-token":"bob"}
OBJECTS={1:{"owner":"alice","name":"alice-report"},2:{"owner":"bob","name":"bob-report"}}
def user(): return TOKENS.get(request.headers.get("X-Training-Token",""))
def log(**kw):
    row={"ts":time.time(),"request_id":request.headers.get("X-Request-ID") or str(uuid.uuid4()),**kw}
    with open("runtime/events.jsonl","a") as f:f.write(json.dumps(row)+"\n")
    return row["request_id"]
@app.get("/")
def home(): return jsonify(service="purple-operator",tokens=list(TOKENS),routes=["/objects/<id>","/admin"])
@app.get("/objects/<int:i>")
def obj(i):
    u=user(); o=OBJECTS.get(i)
    if not u:return jsonify(error="unauthorized"),401
    if not o:return jsonify(error="not found"),404
    cross=u!=o["owner"]; rid=log(event="object_access",user=u,object_id=i,owner=o["owner"],cross_user=cross,result="allowed")
    body={"id":i,**o,"request_id":rid}
    if cross:body["objective"]=os.getenv("PURPLE_OPERATOR_FLAG","FLAG_NOT_CONFIGURED")
    return jsonify(body)
@app.get("/admin")
def admin():
    u=user()
    rid=log(event="admin_access",user=u,result="denied")
    return jsonify(error="forbidden",request_id=rid),403
app.run(host="0.0.0.0",port=5000)
