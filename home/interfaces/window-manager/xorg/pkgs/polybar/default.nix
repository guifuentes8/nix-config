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
       base = #303446
       mantle = #292c3c
       crust = #232634

       text = #c6d0f5
       subtext0 = #a5adce
       subtext1 = #b5bfe2

       surface0 = #414559
       surface1 = #51576d
       surface2 = #626880
 
       overlay0 = #737994
       overlay1 = #838ba7
       overlay2 = #949cbb
 

       blue = #8caaee
       lavender = #babbf1
       sapphire = #85c1dc
       sky = #99d1db
       teal = #81c8be
       green = #a6d189
       yellow = #e5c890
       peach = #ef9f76
       maroon = #ea999c
       red = #e78284
       mauve = #ca9ee6
       pink = #f4b8e4
       flamingo = #a6d189
       rosewater = #f2d5cf

       transparent = #FF00000

       
            [bar/mybar]
            width = 100%
            height = 24pt
            radius = 0

            ; dpi = 96

            background = #303446
            foreground = #8caaee

            line-size = 3pt

            border-size = 0pt
            border-color = #00000000

            padding-left = 0
            padding-right = 1

            module-margin = 1

            separator = \
            separator-foreground = #e4e4e5

            font-0 = JetBrainsMonoNL Nerd Font:size=12;2

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
            label-active-foreground = #a6d189
            label-active-background = #24283b
            label-active-underline= #a6d189
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

            label-mounted = %{F#a6d189}%mountpoint%%{F-} %percentage_used%%

            label-unmounted = %mountpoint% not mounted
            label-unmounted-foreground = #5b6078

    
            [module/pulseaudio]
            type = internal/pulseaudio

            format-volume-prefix = "VOL "
            format-volume-prefix-foreground = #a6d189
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
            label-layout-foreground = #a6d189

            label-indicator-padding = 2
            label-indicator-margin = 1
            label-indicator-foreground = #282A2E
            label-indicator-background = #8ABEB7

            [module/memory]
            type = internal/memory
            interval = 2
            format-prefix = "RAM "
            format-prefix-foreground = #a6d189
            label = %percentage_used:2%%

            [module/cpu]
            type = internal/cpu
            interval = 2
            format-prefix = "CPU "
            format-prefix-foreground = #a6d189
            label = %percentage:2%%

            [network-base]
            type = internal/network
            interval = 5
            format-connected = <label-connected>
            format-disconnected = <label-disconnected>
            label-disconnected = %{F#a6d189}%ifname%%{F#5b6078} disconnected

            [module/wlan]
            inherit = network-base
            interface-type = wireless
            label-connected = %{F#a6d189}%ifname%%{F-} %essid% %local_ip%

            [module/eth]
            inherit = network-base
            interface-type = wired
            label-connected = %{F#a6d189}%ifname%%{F-} %local_ip%

            [module/date]
            type = internal/date
            interval = 1

            date = %H:%M
            date-alt = %d-%m-%Y %H:%M:%S

            label = %date%
            label-foreground = #a6d189

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
