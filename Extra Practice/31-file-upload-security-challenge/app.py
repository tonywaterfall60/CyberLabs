from flask import Flask,request,jsonify,send_from_directory
from pathlib import Path
import uuid
app=Flask(__name__)
ROOT=Path("/tmp/uploads");ROOT.mkdir(exist_ok=True)
ALLOWED={".txt",".png",".jpg",".jpeg"}
@app.get("/")
def home(): return jsonify(service="training-upload",allowed=sorted(ALLOWED),route="/upload")
@app.post("/upload")
def upload():
    f=request.files.get("file")
    if not f:return jsonify(error="missing file"),400
    ext=Path(f.filename).suffix.lower()
    if ext not in ALLOWED:return jsonify(error="extension blocked"),400
    stored=f"{uuid.uuid4().hex}{ext}"
    f.save(ROOT/stored)
    return jsonify(original=f.filename,stored=stored,url=f"/files/{stored}",declared_type=f.content_type)
@app.get("/files/<name>")
def files(name): return send_from_directory(ROOT,name,as_attachment=False)
app.run(host="0.0.0.0",port=5000)
