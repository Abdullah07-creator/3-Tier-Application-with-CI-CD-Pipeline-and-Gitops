FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Prevent Python from writing .pyc files to disk and enable unbuffered logging
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Copy dependencies first to leverage Docker layer caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy backend source code
COPY main.py .

# Expose FastAPI default port
EXPOSE 8000

# Non-root user setup for security hardening
RUN useradd -m appuser && chown -R appuser:appuser /app
USER appuser

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
