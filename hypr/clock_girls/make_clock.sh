#!/usr/bin/env bash

ASSETS_DIR="/home/nirx/.config/hypr/clock_girls"
OUTPUT_IMG="/tmp/hyprlock_clock.png"

# 1. Получаем текущее время
TIME_STR=$(date +"%H%M")

# 2. Склеиваем оригинальные пиксели девочек
magick \
  -filter point \
  "$ASSETS_DIR/${TIME_STR:0:1}.png" \
  "$ASSETS_DIR/${TIME_STR:1:1}.png" \
  "$ASSETS_DIR/sep.png" \
  "$ASSETS_DIR/${TIME_STR:2:1}.png" \
  "$ASSETS_DIR/${TIME_STR:3:1}.png" \
  +append /tmp/girls_raw.png

# 3. ХАК ДЛЯ ОГРОМНЫХ ЧЁТКИХ ПИКСЕЛЕЙ: Увеличиваем ровно в 5 раз (500%)
# Параметр -scale гарантирует, что углы останутся острыми, как бритва
magick /tmp/girls_raw.png -scale 500% /tmp/girls_scaled.png

# 4. Узнаем получившуюся ширину, чтобы сделать идеальный квадратный холст
W=$(magick identify -format "%w" /tmp/girls_scaled.png)

# 5. Создаем квадратный контейнер, чтобы hyprlock не включал свое мыльное сглаживание
magick -size "${W}x${W}" xc:none /tmp/girls_scaled.png -gravity Center -composite "$OUTPUT_IMG"

# Сохраняем точный размер для конфига hyprlock
echo "$W" > /tmp/hyprlock_final_size.txt

# Чистим за собой
rm -f /tmp/girls_raw.png /tmp/girls_scaled.png 2>/dev/null
