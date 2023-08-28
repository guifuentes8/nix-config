#!/bin/bash

echo header

export XDG_CACHE_HOME=~/.cache

WALLPAPER_PATH=~/.config/wallpapers/gifs
IMG_NAME=$(ls ${WALLPAPER_PATH} | shuf -n 1)
IMG_PATH=${WALLPAPER_PATH}/$IMG_NAME

init() {
  swww init
  sleep 2
}
change() {
  swww img "${IMG_PATH}" --transition-type any
}

case "$1" in
change) change ;;
init) init ;;
esac
