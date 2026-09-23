from flask import Flask, jsonify, make_response

app = Flask(__name__)

def tagged(body, status=200):
    resp = make_response(body, status)
    resp.headers["X-CyberLabs-Training"] = "beginner-web"
    return resp

@app.get("/")
def home():
    return tagged("""<!doctype html>
    <h1>CyberLabs Training App</h1>
    <ul>
      <li><a href='/about'>About</a></li>
      <li><a href='/api/status'>API Status</a></li>
      <li><a href='/admin'>Admin</a></li>
    </ul>""")

@app.get("/about")
def about():
    return tagged("<h1>About</h1><p>Authorized local training application.</p>")

@app.get("/api/status")
def status():
    resp = jsonify(service="cyberlabs", status="online", environment="training")
    resp.headers["X-CyberLabs-Training"] = "beginner-web"
    return resp

@app.get("/admin")
def admin():
    return tagged("<h1>403 Forbidden</h1><p>This route requires authorization.</p>", 403)

@app.get("/robots.txt")
def robots():
    return tagged("User-agent: *\nDisallow: /admin\n", 200)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
