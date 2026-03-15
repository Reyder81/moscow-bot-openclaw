FROM node:20-slim
WORKDIR /app

# Устанавливаем зависимости
RUN apt-get update && apt-get install -y curl bash git

# Устанавливаем OpenClaw
RUN curl -fsSL https://openclaw.ai/install.sh | bash

# Важно: добавляем переменные окружения и пути
ENV PATH="/root/.local/bin:${PATH}"

# Создаем скрипт-обертку, чтобы бот не падал
# И используем 'tail -f /dev/null' для поддержания контейнера запущенным, если процесс умрет
CMD ["/bin/bash", "-c", "openclaw start"]
