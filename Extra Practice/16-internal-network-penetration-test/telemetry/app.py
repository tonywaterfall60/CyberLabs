from http.server import BaseHTTPRequestHandler, HTTPServer
import json

class H(BaseHTTPRequestHandler):
    def do_GET(self):
        body = json.dumps({'service':'telemetry','status':'ok','range':'ep16'}).encode()
        self.send_response(200)
        self.send_header('Content-Type','application/json')
        self.end_headers()
        self.wfile.write(body)

HTTPServer(('0.0.0.0', 9000), H).serve_forever()