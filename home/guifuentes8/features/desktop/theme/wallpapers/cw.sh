#!/bin/bash

echo header

export XDG_CACHE_HOME=~/.cache

WALLPAPER_PATH=~/.config/gifs
IMG_NAME=$(ls ${WALLPAPER_PATH} | shuf -n 1)
IMG_PATH=${WALLPAPER_PATH}/$IMG_NAME
#swaybg -i "${IMG_PATH}"

init() {
  swww init
  sleep 3
}
change() {
  swww img "${IMG_PATH}" --resize fit --filter Nearest --transition-type fade --transition-fps 60
}

case "$1" in
change) change ;;
init) init ;;
esac

