#!/usr/bin/env bash

# Генерируем актуальную картинку при старте системы
/home/nirx/.config/hypr/clock_girls/make_clock.sh

LAST_MIN=$(date +"%M")

while true; do
    CURRENT_MIN=$(date +"%M")

    if [ "$CURRENT_MIN" != "$LAST_MIN" ]; then
        # Минута изменилась — просто обновляем файл картинки
        /home/nirx/.config/hypr/clock_girls/make_clock.sh
        
        LAST_MIN=$CURRENT_MIN
    fi

    # Проверяем каждые 0.5 сек, чтобы точно поймать начало минуты
    sleep 0.5
done