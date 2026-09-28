import os
from flask import Flask, jsonify, request

app = Flask(__name__)
TOKEN = os.getenv('SERVICE_TOKEN', 'not-configured')
ARTIFACT = os.getenv('RANGE_ARTIFACT', 'TRAINING_ARTIFACT_NOT_CONFIGURED')

@app.get('/')
def home():
    return jsonify(service='northstar-api', environment='training', routes=['/health','/api/status'])

@app.get('/health')
def health():
    return jsonify(status='ok')

@app.get('/api/status')
def status():
    return jsonify(service='northstar-api', version='2026.09', environment='training', auth='X-Service-Token')

@app.get('/api/export')
def export():
    if request.headers.get('X-Service-Token') != TOKEN:
        return jsonify(error='forbidden'), 403
    return jsonify(artifact=ARTIFACT, classification='protected-training')

app.run(host='0.0.0.0', port=5000)