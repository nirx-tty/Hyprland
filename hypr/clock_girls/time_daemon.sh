#!/usr/bin/env bash

# Запоминаем стартовую минуту
LAST_MIN=$(date +"%M")

while true; do
    CURRENT_MIN=$(date +"%M")

    # Если минута изменилась — пришло время обновлять часы!
    if [ "$CURRENT_MIN" != "$LAST_MIN" ]; then
        # 1. Запускаем сборку новой картинки девочек
        /home/nirx/.config/hypr/clock_girls/make_clock.sh

        # 2. Пинаем hyprlock, чтобы он мгновенно сбросил кэш и обновил экран
        pkill -USR1 hyprlock

        # Обновляем значение последней минуты
        LAST_MIN=$CURRENT_MIN
    fi

    # Спим 1 секунду перед следующей проверкой, чтобы вообще не грузить процессор
    sleep 1
done
