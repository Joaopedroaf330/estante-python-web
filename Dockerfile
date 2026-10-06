FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV PORT=5000

CMD ["sh", "-c", "python criar_banco.py && gunicorn app:app --bind 0.0.0.0:${PORT}"]
