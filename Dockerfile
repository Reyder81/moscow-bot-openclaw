FROM node:20-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y curl bash git bsdutils

# Установка OpenClaw (обход интерактивности)
RUN curl -fsSL https://openclaw.ai/install.sh -o install.sh && \
    sed -i 's/\/dev\/tty/\/dev\/null/g' install.sh && \
    yes | bash install.sh --non-interactive

# Настройка путей
ENV PATH="/root/.local/bin:${PATH}"

# ОПТИМИЗАЦИЯ ПАМЯТИ: 
# Отключаем телеметрию, принудительно ставим production-режим
ENV NODE_ENV=production
ENV OPENCLAW_TELEMETRY=false

# ЗАПУСК: 
# Мы используем 'node' напрямую с лимитом памяти, чтобы обойти проблемы с Bash-скриптами
# Если скрипт требует bash-обертки, мы заставляем его работать внутри этого лимита
CMD ["node", "--max-old-space-size=192", "/root/.local/bin/openclaw", "start", "--no-telemetry", "--no-check-update"]
