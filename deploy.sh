#!/bin/bash
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

error_exit() {
    echo -e "${RED}Ошибка: $1${NC}" >&2
    exit 1
}

# Проверка Docker
if ! command -v docker &> /dev/null; then
    error_exit "Docker не установлен. Установите Docker перед запуском."
fi

# Проверка Docker Compose
if ! docker compose version &> /dev/null; then
    error_exit "Docker Compose не установлен. Установите Docker Compose Plugin."
fi

# Запуск системы
echo -e "${GREEN}Запуск инфраструктуры...${NC}"
docker compose -f docker-compose.prod.yml pull
docker compose -f docker-compose.prod.yml up -d

echo -e "${GREEN}Готово! Система запущена.${NC}"
echo -e "Приложение доступно на ${GREEN}http://localhost:8080${NC}"