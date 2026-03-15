# Используем легковесный образ Node.js
FROM node:20-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y curl bash git bsdutils

# "yes |" автоматически отвечает "y" (Yes) на любые вопросы установщика,
# а 'script' имитирует терминал, чтобы обойти ошибку /dev/tty
RUN script -q -c "yes | curl -fsSL https://openclaw.ai/install.sh | bash -s -- --non-interactive" /dev/null

# Настройка путей, чтобы команда 'openclaw' была доступна системе
ENV PATH="/root/.local/bin:${PATH}"

# Запуск бота
CMD ["openclaw", "start"]
