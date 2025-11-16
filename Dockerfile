FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

COPY . /app

RUN chmod +x examples/basic/setup.sh && \
    bash examples/basic/setup.sh

ENV HF_HOME=/app/cache
ENV TRANSFORMERS_CACHE=/app/cache

EXPOSE 8000

CMD ["/bin/bash", "-c", "source venv/bin/activate && python examples/basic/server.py"]