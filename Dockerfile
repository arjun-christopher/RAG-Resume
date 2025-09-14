FROM python:3.11-slim


# System deps for Tesseract & PDFs
RUN apt-get update && apt-get install -y \
tesseract-ocr \
libgl1 \
&& rm -rf /var/lib/apt/lists/*


WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt


COPY app ./app
COPY .env.example ./.env


EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]