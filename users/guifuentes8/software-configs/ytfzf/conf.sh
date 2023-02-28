ytdl_pref="248+bestaudio/best"
skip_thumb_download=1
show_formats=1
enable_hist=1
search_again=1
video_pref="bestvideo"
audio_pref="bestaudio"
##Functions {{{
external_menu () {
    #use rofi instead of dmenu
    rofi -dmenu -p "$1"
}

