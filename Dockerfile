FROM node:20-slim

WORKDIR /app

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y curl bash git bsdutils

# Установка с обходом интерактивных запросов
RUN curl -fsSL https://openclaw.ai/install.sh -o install.sh && \
    sed -i 's/\/dev\/tty/\/dev\/null/g' install.sh && \
    yes | bash install.sh --non-interactive

# Настройка путей
ENV PATH="/root/.local/bin:${PATH}"

# Запуск скрипта напрямую через bash
CMD ["/bin/bash", "/root/.local/bin/openclaw", "start"]
