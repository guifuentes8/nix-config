{ pkgs, ... }: {
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      i3Support = true;
      alsaSupport = true;
      iwSupport = true;
      githubSupport = true;
      pulseSupport = true;
    };
    script = "polybar mybar &";
    extraConfig = ''
           ;==========================================================
       ;
       ;
       ;   ██████╗  ██████╗ ██╗  ██╗   ██╗██████╗  █████╗ ██████╗
       ;   ██╔══██╗██╔═══██╗██║  ╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗
       ;   ██████╔╝██║   ██║██║   ╚████╔╝ ██████╔╝███████║██████╔╝
       ;   ██╔═══╝ ██║   ██║██║    ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗
       ;   ██║     ╚██████╔╝███████╗██║   ██████╔╝██║  ██║██║  ██║
       ;   ╚═╝      ╚═════╝ ╚══════╝╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
       ;
       ;
       ;   To learn more about how to configure Polybar
       ;   go to https://github.com/polybar/polybar
       ;
       ;   The README contains a lot of information
       ;
       ;==========================================================
       
       [bar/mybar]
       width = 100%
       height = 18pt
       radius = 0

       ; dpi = 96

       background = #24283b
       foreground = #9aa5ce 

       line-size = 0pt

       border-size = 0pt
       border-color = #00000000

       padding-left = 0
       padding-right = 1
       offset-y = 8

       module-margin = 8px

       separator = 
       separator-foreground = #2ac3de

       font-0 = "JetBrainsMonoNL Nerd Font:size=13;1"
       font-1 = "JetBrainsMonoNL Nerd Font:size=18;2"
       label-active-font = 2


       modules-left = xworkspaces 
       modules-center = 
       modules-right = himalaya filesystem memory cpu xkeyboard wlan eth pulseaudio date

       cursor-click = pointer
       cursor-scroll = ns-resize

       enable-ipc = true

       tray-position = right

       ; wm-restack = generic
        wm-restack = bspwm
       ; wm-restack = i3

       ; override-redirect = true

       [module/xworkspaces]
       type = internal/xworkspaces

       label-active = %name%
       label-active-font = 2
       label-empty-font = 2
       label-occupied-font = 2

       label-active-foreground = #2ac3de
       label-active-background = #24283b
       label-active-underline= #a6d189
       label-active-padding = 1

       label-occupied = %name%
       label-occupied-foreground = #cad3f5
       label-occupied-padding = 1

       label-urgent = %name%
       label-urgent-background = #ed8796
       label-urgent-padding = 1

       label-empty = %name%
       label-empty-foreground = #cad3f5
       label-empty-padding = 1

       [module/xwindow]
       type = internal/xwindow
       label = %title:0:60:...%

       [module/filesystem]
       type = internal/fs
       interval = 25

       mount-0 = /

       label-mounted = %{F#bb9af7}󰋊%{F-} %{F#bb9af7}%percentage_used%%%{F-}

       label-unmounted = %mountpoint% not mounted
       label-unmounted-foreground = #5b6078

       

      [module/memory]
       type = internal/memory
       interval = 2
       format = 󰍛 <label>%
       label = %percentage_used%
       format-foreground = #f7768e

       [module/cpu]
       type = internal/cpu
       interval = 2
       format = 󰻠 <label>%
       label = %percentage%
       format-foreground = #f7768e

       [module/pulseaudio]
       type = internal/pulseaudio
       format-volume = <ramp-volume> <label-volume>
       label-muted = 󰖁 muted
       ramp-volume-foreground = #73daca
       label-volume-foreground = #73daca
       label-muted-foreground = #1a1b26

       ramp-volume-0 = 
       ramp-volume-1 = 
       ramp-volume-2 = 


       click-right = pavucontrol

       scroll-up = notify-send Volume %percentage%%
       scroll-down = notify-send Volume %percentage%%


       [module/xkeyboard]
       type = internal/xkeyboard
       blacklist-0 = num lock

       label-layout = 󰌌 %layout% 
       label-layout-foreground = #e0af68
       label-indicator-on-capslock =   Caps lock
       label-indicator-off-capslock =   Caps lock
       label-indicator-on-capslock-foreground = #e0af68
       label-indicator-off-capslock-foreground = #e0af68


       label-indicator-padding = 2
       label-indicator-margin = 1
       label-indicator-foreground = #282A2E
       label-indicator-background = #e0af68


       [network-base]
       type = internal/network
       interval = 5
       format-connected = %{F#ff9e64}󱂇 Connected%{F#ff9e64}
       format-disconnected = :/ Disconnected
       label-disconnected = %{F#f7768e}%ifname%%{F#f7768e} disconnected

       [module/wlan]
       inherit = network-base
       interface-type = wireless
       label-connected =   %essid% 

       [module/eth]
       inherit = network-base
       interface-type = wired
       label-connected = %{F#ff9e64}%ifname%%{F-}

       [module/date]
       type = internal/date
       interval = 1

       date = %H:%M:%S
       date-alt = Data: %d/%m/%Y Hora: %H:%M:%S

       label = %date% 
       label-foreground = #b4f9f8

    '';
  };
}
