FROM python:3.13 AS builder

WORKDIR /app

ADD . /app

RUN pip install -r requirements.txt

CMD ["sh", "-c", "gunicorn --workers 4 --bind 0.0.0.0:8000 main:app --access-logfile -"]
