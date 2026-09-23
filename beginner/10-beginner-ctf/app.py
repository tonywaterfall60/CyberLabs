from http.server import BaseHTTPRequestHandler, HTTPServer
import os

FLAG = os.getenv("WEB_FLAG_VALUE", "FLAG_NOT_CONFIGURED")

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/robots.txt":
            body = b"User-agent: *\nDisallow: /training-admin\n"
            status = 200
            ctype = "text/plain"
        elif self.path == "/training-admin":
            body = ("Private event flag: " + FLAG + "\n").encode()
            status = 200
            ctype = "text/plain"
        elif self.path == "/":
            body = b"<h1>CyberLabs Beginner CTF</h1><p>Authorized local training service.</p>"
            status = 200
            ctype = "text/html"
        else:
            body = b"Not found\n"
            status = 404
            ctype = "text/plain"

        self.send_response(status)
        self.send_header("Content-Type", ctype)
        self.send_header("X-CyberLabs-Training", "beginner-ctf")
        self.end_headers()
        self.wfile.write(body)

HTTPServer(("0.0.0.0", 8000), Handler).serve_forever()
