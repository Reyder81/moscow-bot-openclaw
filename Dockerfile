FROM node:20-slim
WORKDIR /app
RUN apt-get update && apt-get install -y curl bash
RUN curl -fsSL https://openclaw.ai/install.sh | bash
ENV PATH="/root/.local/bin:${PATH}"
CMD ["openclaw", "start"]
