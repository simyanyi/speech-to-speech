# Dockerfile.vllm
FROM vllm/vllm-openai:latest

ENV HF_HOME=/models

EXPOSE 8001

CMD ["vllm", "serve", "Qwen/Qwen3-30B-A3B-Instruct-2507", \
     "--port", "8001", \
     "--quantization", "fp8", \
     "--gpu-memory-utilization", "0.5"]