FROM node:20-slim
WORKDIR /app

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y curl bash git

# Устанавливаем OpenClaw в неинтерактивном режиме
RUN curl -fsSL https://openclaw.ai/install.sh | bash -s -- --non-interactive

# Настройка путей
ENV PATH="/root/.local/bin:${PATH}"

# Запуск бота
CMD ["openclaw", "start"]
