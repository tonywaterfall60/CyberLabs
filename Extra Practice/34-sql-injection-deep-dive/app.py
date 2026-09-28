import os,sqlite3
from flask import Flask,request,jsonify
app=Flask(__name__)
def db():
    c=sqlite3.connect(":memory:")
    c.executescript("CREATE TABLE products(id INTEGER,name TEXT,category TEXT);INSERT INTO products VALUES(1,'Widget','hardware'),(2,'Guide','training');CREATE TABLE secrets(id INTEGER,value TEXT);")
    c.execute("INSERT INTO secrets VALUES(1,?)",(os.getenv("SQL_FLAG_VALUE","FLAG_NOT_CONFIGURED"),))
    return c
@app.get("/")
def home(): return jsonify(service="catalog",routes=["/search?q=Widget","/exists?name=Widget"])
@app.get("/search")
def search():
    q=request.args.get("q","")
    sql=f"SELECT id,name,category FROM products WHERE name LIKE '%{q}%'"
    try:
        rows=db().execute(sql).fetchall()
        return jsonify(sql=sql,rows=rows)
    except Exception as e:return jsonify(error=str(e)),400
@app.get("/exists")
def exists():
    n=request.args.get("name","")
    sql=f"SELECT 1 FROM products WHERE name='{n}' LIMIT 1"
    try:return jsonify(exists=db().execute(sql).fetchone() is not None)
    except Exception:return jsonify(exists=False)
app.run(host="0.0.0.0",port=5000)
