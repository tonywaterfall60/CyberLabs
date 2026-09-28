FROM python:3.13-slim
WORKDIR /app
COPY requirements.txt app.py entrypoint.sh ./
RUN pip install --no-cache-dir -r requirements.txt && chmod +x entrypoint.sh
CMD ["./entrypoint.sh"]
