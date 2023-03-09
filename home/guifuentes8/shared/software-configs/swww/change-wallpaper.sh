#!/bin/bash

echo header

export XDG_CACHE_HOME=~/.cache

WALLPAPER_PATH=~/.config/wallpapers/gif
IMG_NAME=$(ls ${WALLPAPER_PATH} | shuf -n 1)
IMG_PATH=${WALLPAPER_PATH}/$IMG_NAME
#swaybg -i "${IMG_PATH}"

init(){
    swww init
    sleep 3
    swww img "${IMG_PATH}" --transition-step 60 --transition-fps 60 --transition-type random
}
change(){
    notify-send -u "normal" "🌁 Wallpaper Changed -> ${IMG_NAME}"
    swww img "${IMG_PATH}" --transition-step 60 --transition-fps 60 --transition-type random ;
}

case "$1" in
  change) change;;
  init) init;;
esac