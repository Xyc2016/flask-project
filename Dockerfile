FROM python:3.13-alpine AS builder

WORKDIR /app

COPY requirements.txt .
RUN --mount=type=cache,target=/root/.cache/pip,id=flask-project-pip pip install -r requirements.txt
RUN adduser --uid 1000 app

USER app

COPY --chown=app:app . .
CMD ["sh", "-c", "gunicorn --workers 4 --bind 0.0.0.0:8000 main:app --access-logfile - --error-logfile -"]
