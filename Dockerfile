FROM nvcr.io/nvidia/pytorch:25.03-py3

ENV PYTHONUNBUFFERED 1
ENV PATH="/usr/src/app/.venv/bin:${PATH}"

WORKDIR /usr/src/app

# Install packages
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir uv

COPY pyproject.toml ./
RUN uv sync --no-install-project --no-dev --extra faster-whisper --extra pocket

COPY . .
RUN uv sync --no-dev --extra faster-whisper --extra pocket

ENTRYPOINT []
