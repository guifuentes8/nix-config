external_menu() {
    rofi -dmenu -p "$1"
}

#video_player () {
#  devour mpv "$@"
#}

#audio_player() {
#  devour mpv "$@"
#}

show_thumbnails=1
fzf_preview_side="right"
notify_playing=1
show_formats=1
search_again=1
skip_thumb_download=1
pages_to_scrape=5
ytdl_opts="-P /home/guifuentes8/Videos/Youtube_Downloads"
