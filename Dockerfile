FROM python:3.13-slim-bookworm AS builder

WORKDIR /app

COPY requirements.txt .
RUN --mount=type=cache,target=/root/.cache/pip,id=flask-project-pip pip install -r requirements.txt
RUN adduser -u 1000 op

USER op

ADD . /app
CMD ["sh", "-c", "gunicorn --workers 4 --bind 0.0.0.0:8000 main:app --access-logfile -"]
