sxhkd &
picom &

systemctl --user restart polybar.service
xrandr -s 5120x1440
feh --bg-scale --randomize ~/.config/wallpapers/images/5120x1440/w1-5120.png

pkill dunst
dunst &

himalaya -a gcf notify -k 50 &
himalaya -a gcf watch -k 50 &
himalaya -a guifuentes8 notify -k 50 &
himalaya -a guifuentes8 watch -k 50 &
