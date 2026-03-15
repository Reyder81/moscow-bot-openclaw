FROM node:20-slim
WORKDIR /app
RUN apt-get update && apt-get install -y curl bash git
RUN curl -fsSL https://openclaw.ai/install.sh | bash
# Добавляем прямой путь к исполняемому файлу
ENV PATH="/root/.local/bin:${PATH}"
# Используем полный путь для запуска
CMD ["/root/.local/bin/openclaw", "start"]
