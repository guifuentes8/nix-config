#!/bin/bash

echo header

export XDG_CACHE_HOME=~/.cache

WALLPAPER_PATH=~/.config/wallpapers/gif
IMG_NAME=$(ls ${WALLPAPER_PATH} | shuf -n 1)
IMG_PATH=${WALLPAPER_PATH}/$IMG_NAME
#swaybg -i "${IMG_PATH}"

init() {
  swww init
  sleep 3
}
change() {
  notify-send -u "normal" "🕶 Wallpaper Changed 🕶"
  swww img "${IMG_PATH}" --transition-duration 2 --transition-step 60 --transition-fps 30 --transition-type grow --transition-pos top-right
}

case "$1" in
change) change ;;
init) init ;;
esac
