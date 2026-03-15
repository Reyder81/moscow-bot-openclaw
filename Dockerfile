FROM node:20-slim
WORKDIR /app

# Устанавливаем зависимости
RUN apt-get update && apt-get install -y curl bash git

# ХИТРОСТЬ: Создаем пустой файл и подменяем им /dev/tty с помощью переменной окружения
# Или просто перенаправляем вывод скрипта, чтобы он не лез в терминал
RUN curl -fsSL https://openclaw.ai/install.sh -o install.sh && \
    sed -i 's/\/dev\/tty/\/dev\/null/g' install.sh && \
    bash install.sh --non-interactive

# Настройка путей
ENV PATH="/root/.local/bin:${PATH}"

# Запуск бота
CMD ["openclaw", "start"]
