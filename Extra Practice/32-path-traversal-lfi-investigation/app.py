import os
from pathlib import Path
from flask import Flask,request,jsonify
app=Flask(__name__)
BASE=Path("/tmp/doclab"); PUB=BASE/"public"; TRAIN=BASE/"training"
PUB.mkdir(parents=True,exist_ok=True); TRAIN.mkdir(exist_ok=True)
(PUB/"welcome.txt").write_text("Welcome to the training document service.\n")
(PUB/"policy.txt").write_text("Only approved public documents should be visible.\n")
(TRAIN/"objective.txt").write_text(os.getenv("TRAVERSAL_FLAG_VALUE","FLAG_NOT_CONFIGURED")+"\n")
@app.get("/")
def home(): return jsonify(service="document-viewer",documents=["welcome.txt","policy.txt"],route="/view?file=welcome.txt")
@app.get("/view")
def view():
    name=request.args.get("file","")
    candidate=(PUB/name)
    resolved=candidate.resolve()
    if BASE.resolve() not in resolved.parents:
        return jsonify(error="outside training root"),403
    if not resolved.is_file():return jsonify(error="not found"),404
    return resolved.read_text(),200,{"Content-Type":"text/plain"}
app.run(host="0.0.0.0",port=5000)
