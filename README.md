# Инфраструктура Polytech Smart Greenhouse

Этот репозиторий содержит конфигурацию для развертывания backend-системы "Умная теплица" на Raspberry Pi.

## Требования
- Raspberry Pi 3/4 с ОС Raspberry Pi OS (64-bit)
- Установленные:
    - Docker ([инструкция](https://docs.docker.com/engine/install/debian/))
    - Docker Compose Plugin ([инструкция](https://docs.docker.com/compose/install/linux/))

## Быстрый старт

1. Клонируйте репозиторий:
    ```bash
    git clone https://github.com/smart-greenhouse-polytech/backend-infrastructure
    ```
2. Запустите скрипт для деплоя в этом репозитории:
    ```bash
    ./deploy.sh
    ```
   Необходимые переменные среды для запуска скрипта, в случае отсутствия будут взяты значения по-умолчанию
   ```bash
    export DOCKERHUB_IMAGE="your-custom-image" # Образ приложения
    ```

## Управление
### Просмотр логов
```bash
docker compose logs -f polytech-smart-greenhouse-app
```
### Остановка
```bash
docker compose down
```
### Обновление
```bash
docker compose pull && docker compose up -d
```

### Бэкап Базы Данных
```bash
docker exec polytech-smart-greenhouse-postgres pg_dump -U user polytech-smart-house > backup.sql
```