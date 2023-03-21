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

      [colors]
       base = #24273a
       mantle = #1e2030
       crust = #181926

       text = #cad3f5
       subtext0 = #a5adcb
       subtext1 = #b8c0e0

       surface0 = #363a4f
       surface1 = #494d64
       surface2 = #5b6078
      
       overlay0 = #6e738d
       overlay1 = #8087a2
       overlay2 = #939ab7

       blue = #8aadf4
       lavender = #b7bdf8
       sapphire = #7dc4e4
       sky = #91d7e3
       teal = #8bd5ca
       green = #a6da95
       yellow = #eed49f
       peach = #f5a97f
       maroon = #ee99a0
       red = #ed8796
       mauve = #c6a0f6
       pink = #f5bde6
       flamingo = #f0c6c6
       rosewater = #f4dbd6

       transparent = #FF00000

      [bar/mybar]
      width = 100%
      height = 20pt
      radius = 0

      ; dpi = 96

      background = #aa24273a
      foreground = #a6da95

      line-size = 2pt

      border-size = 0pt
      border-color = #00000000

      padding-left = 0
      padding-right = 1

      module-margin = 1

      separator = |
      separator-foreground = #a5adcb

      font-0 = JetBrainsMono Nerd:size=9;2

      modules-left = xworkspaces 
      modules-center = xwindow
      modules-right = filesystem pulseaudio xkeyboard memory cpu wlan eth date

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
      label-active-foreground = #8bd5ca
      label-active-background = #363a4f
      label-active-underline= #8bd5ca
      label-active-padding = 2

      label-occupied = %name%
      label-occupied-padding = 2

      label-urgent = %name%
      label-urgent-background = #ed8796
      label-urgent-padding = 2

      label-empty = %name%
      label-empty-foreground = #cad3f5
      label-empty-padding = 2

      [module/xwindow]
      type = internal/xwindow
      label = %title:0:60:...%

      [module/filesystem]
      type = internal/fs
      interval = 25

      mount-0 = /

      label-mounted = %{F#91d7e3}%mountpoint%%{F-} %percentage_used%%

      label-unmounted = %mountpoint% not mounted
      label-unmounted-foreground = #5b6078

    
      [module/pulseaudio]
      type = internal/pulseaudio

      format-volume-prefix = "VOL "
      format-volume-prefix-foreground = #91d7e3
      format-volume = <label-volume>

      label-volume = %percentage%%

      label-muted = muted
      label-muted-foreground = #5b6078

      click-right = pavucontrol

      scroll-up = notify-send Volume %percentage%%
      scroll-down = notify-send Volume %percentage%%


      [module/xkeyboard]
      type = internal/xkeyboard
      blacklist-0 = num lock

      label-layout = %layout%
      label-layout-foreground = #91d7e3

      label-indicator-padding = 2
      label-indicator-margin = 1
      label-indicator-foreground = #282A2E
      label-indicator-background = #8ABEB7

      [module/memory]
      type = internal/memory
      interval = 2
      format-prefix = "RAM "
      format-prefix-foreground = #91d7e3
      label = %percentage_used:2%%

      [module/cpu]
      type = internal/cpu
      interval = 2
      format-prefix = "CPU "
      format-prefix-foreground = #91d7e3
      label = %percentage:2%%

      [network-base]
      type = internal/network
      interval = 5
      format-connected = <label-connected>
      format-disconnected = <label-disconnected>
      label-disconnected = %{F#91d7e3}%ifname%%{F#5b6078} disconnected

      [module/wlan]
      inherit = network-base
      interface-type = wireless
      label-connected = %{F#91d7e3}%ifname%%{F-} %essid% %local_ip%

      [module/eth]
      inherit = network-base
      interface-type = wired
      label-connected = %{F#91d7e3}%ifname%%{F-} %local_ip%

      [module/date]
      type = internal/date
      interval = 1

      date = %H:%M
      date-alt = %Y-%m-%d %H:%M:%S

      label = %date%
      label-foreground = #91d7e3

      [settings]
      screenchange-reload = true
      pseudo-transparency = true

      ; vim:ft=dosini

      [module/bluetooth]
        type = custom/script
        exec = rofi-bluetooth --status
        interval = 1
        click-left = rofi-bluetooth &
    '';
  };
}
