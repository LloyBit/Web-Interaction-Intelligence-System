FROM python:3.13-slim

WORKDIR /app

# Установка uv
RUN pip install uv

# Копирование файлов проекта
COPY pyproject.toml uv.lock ./

# Создание виртуального окружения для проекта
RUN uv venv

# Синхронизация зависимостей в окружение
RUN uv sync

# Копирование остального кода
COPY . .

# Запуск приложения
CMD ["uv", "run", "python", "app.py"]
