# Используем легковесный образ Python
FROM python:3.9-slim

# Настраиваем Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файл зависимостей
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем исходный код приложения
COPY . .

# Открываем порт приложения
EXPOSE 7345

# Запускаем Flask
CMD ["python", "manage.py", "runserver"]