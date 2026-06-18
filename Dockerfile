FROM python:3.11-slim

# ติดตั้งเครื่องมือคอมไพล์โค้ดที่จำเป็น
RUN apt-get update && apt-get install -y gcc libffi-dev libssl-dev && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# ติดตั้งไลบรารี
RUN pip install --no-cache-dir -r requirements.txt

# สั่งให้รันด้วย Gunicorn เพื่อความเสถียร
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
