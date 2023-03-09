#!/bin/bash

echo start

]
export XDG_CACHE_HOME=~/.cache

WALLPAPER_PATH=~/.config/wallpapers/gif
IMG_NAME=$(ls ${WALLPAPER_PATH} | shuf -n 1 )
IMG_PATH=${WALLPAPER_PATH}/$IMG_NAME

change(){
    notify-send -u "normal" "🌁 Wallpaper Changed -> ${IMG_NAME}" 
    xgifwallpaper --scale FILL "${IMG_PATH}"
    sleep 1
    picom &
}

case "$1" in
  change) change;;
  init) init;;
esac