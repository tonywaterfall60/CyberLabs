FROM python:latest
WORKDIR /app
COPY . /app
ENV APP_ADMIN_TOKEN=training-do-not-use
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python", "app/app.py"]
