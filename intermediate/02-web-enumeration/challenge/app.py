from flask import Flask, request, jsonify, make_response

app = Flask(__name__)

def resp(body, status=200):
    r = make_response(body, status)
    r.headers["X-CyberLabs-App"] = "intermediate-enum"
    return r

@app.get("/")
def home():
    r = resp("""<!doctype html><h1>CyberLabs App</h1>
    <ul>
      <li><a href='/about'>About</a></li>
      <li><a href='/search?q=training'>Search</a></li>
      <li><a href='/api/status'>API Status</a></li>
    </ul>""")
    r.set_cookie("session_hint","guest")
    return r

@app.get("/about")
def about():
    return resp("<h1>About</h1><p>Training application.</p>")

@app.get("/search")
def search():
    q = request.args.get("q","")
    return resp(f"<h1>Search</h1><p>Query: {q}</p>")

@app.get("/api/status")
def status():
    r = jsonify(service="cyberlabs", status="online", role="training")
    r.headers["X-CyberLabs-App"] = "intermediate-enum"
    return r

@app.get("/admin")
def admin():
    return resp("<h1>403 Forbidden</h1>",403)

@app.get("/robots.txt")
def robots():
    return resp("User-agent: *\nDisallow: /admin\nDisallow: /debug-info\n")

@app.get("/debug-info")
def debug_info():
    return resp("environment=training\nbuild=intermediate\n")

if __name__ == "__main__":
    app.run(host="0.0.0.0",port=5000)
