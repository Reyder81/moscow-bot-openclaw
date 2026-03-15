# 1. Используем еще более легкий образ (alpine), если node:20-slim слишком "тяжелый"
FROM node:20-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем зависимости
RUN apt-get update && apt-get install -y curl bash git bsdutils

# "yes |" отвечает "Yes" на вопросы, sed правит скрипт, чтобы не искал /dev/tty
RUN curl -fsSL https://openclaw.ai/install.sh -o install.sh && \
    sed -i 's/\/dev\/tty/\/dev\/null/g' install.sh && \
    yes | bash install.sh --non-interactive

# Настройка путей
ENV PATH="/root/.local/bin:${PATH}"

# ОПТИМИЗАЦИЯ ПАМЯТИ:
# 1. Ограничиваем Heap до 192МБ (оставляем запас для самого процесса Node)
# 2. Отключаем проверку обновлений и телеметрию, чтобы сэкономить память
ENV NODE_OPTIONS="--max-old-space-size=192"
ENV OPENCLAW_TELEMETRY=false
ENV NODE_ENV=production

# Запуск с явным указанием лимита памяти для процесса
CMD ["node", "--max-old-space-size=192", "/root/.local/bin/openclaw", "start"]
