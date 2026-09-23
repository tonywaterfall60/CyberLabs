from http.server import BaseHTTPRequestHandler, HTTPServer
import os

FLAG = os.getenv("WEB_FLAG_VALUE", "FLAG_NOT_CONFIGURED")

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/":
            body = b"<h1>Intermediate CTF Web</h1><p>Authorized training service.</p>"
            status = 200
        elif self.path == "/flag":
            body = ("Private event flag: " + FLAG + "\n").encode()
            status = 200
        else:
            body = b"Not found\n"
            status = 404

        self.send_response(status)
        self.send_header("Content-Type", "text/html")
        self.end_headers()
        self.wfile.write(body)

HTTPServer(("0.0.0.0", 8000), Handler).serve_forever()
