FROM node:20-slim
WORKDIR /app

# Устанавливаем зависимости
RUN apt-get update && apt-get install -y curl bash git

# Скачиваем скрипт, но не запускаем его сразу, а правим, чтобы он не просил "Yes"
RUN curl -fsSL https://openclaw.ai/install.sh -o install.sh && \
    sed -i 's/read -p/echo "y" | read -p/g' install.sh && \
    bash install.sh --non-interactive

# Настройка путей
ENV PATH="/root/.local/bin:${PATH}"

# Запуск бота
CMD ["openclaw", "start"]
