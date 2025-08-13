FROM python:3.13-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

ADD . /app

RUN uv sync

CMD ["sh", "-c", "uv run wsgi.py"]
