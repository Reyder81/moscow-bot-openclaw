# Используем легковесный образ Node.js
FROM node:20-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем системные зависимости: curl, bash, git и bsdutils (для работы 'script')
RUN apt-get update && apt-get install -y curl bash git bsdutils

# Обходим ошибку /dev/tty с помощью утилиты 'script'
# Это имитирует терминал, позволяя скрипту установки завершиться успешно
RUN script -q -c "curl -fsSL https://openclaw.ai/install.sh | bash -s -- --non-interactive" /dev/null

# Настройка путей, чтобы команда 'openclaw' была доступна системе
ENV PATH="/root/.local/bin:${PATH}"

# Запуск бота (используем прямой вызов, так как путь прописан в PATH)
CMD ["openclaw", "start"]
