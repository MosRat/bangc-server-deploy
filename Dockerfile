FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y python3-pip curl \
    && pip3 install uv --break-system-packages

EXPOSE 8765
ENV PORT=8765

CMD uvx --refresh bangc-mcp-server@latest serve --http --http-cors --addr 0.0.0.0:${PORT}
