{ pkgs, config, ... }: {
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
      [bar/mybar]
       width = 100%
       height = 32pt
       radius = 0


       background = #${config.colorScheme.colors.base01}
       foreground = #${config.colorScheme.colors.base00} 
       line-size = 0pt
       border-size = 0pt
       border-color = #${config.colorScheme.colors.base0E}
       padding-left = 1
       padding-right = 1
       offset-y = 0
       module-margin = 8px
       separator = 
       separator-foreground = #${config.colorScheme.colors.base0A}
       cursor-click = pointer
       cursor-scroll = ns-resize
       enable-ipc = true
       tray-position = right
       wm-restack = bspwm
       bottom = false

       font-0 = "JetBrainsMonoNL Nerd Font:size=11;1"
       font-1 = "JetBrainsMonoNL Nerd Font:size=16;2"
       label-active-font = 2

       modules-left = xworkspaces  
       modules-center = xwindow 
       modules-right = filesystem memory cpu wlan eth pulseaudio date

      ; ------- WORKSPACES ---------
    
      [module/xworkspaces]
       type = internal/xworkspaces

       label-active = %name%
       label-active-font = 2
       label-empty-font = 2
       label-occupied-font = 2

       label-active-foreground = #${config.colorScheme.colors.base00}
       label-active-background = #${config.colorScheme.colors.base01}
       label-active-underline= #${config.colorScheme.colors.base09}
       label-active-padding = 2

       label-occupied = %name%
       label-occupied-foreground = #${config.colorScheme.colors.base0A}
       label-occupied-padding = 2

       label-urgent = %name%
       label-urgent-background = #cc${config.colorScheme.colors.base02}
       label-urgent-foreground = #${config.colorScheme.colors.base08}
       label-urgent-padding = 2

       label-empty = %name%
       label-empty-foreground = #${config.colorScheme.colors.base0E}
       label-empty-padding = 2

      ; ------- WINDOWS ---------

       [module/xwindow]
       type = internal/xwindow
       label = %title:0:60:...%

      ; ------- SYSTEM INFO ---------

       [module/filesystem]
       type = internal/fs
       interval = 25
       mount-0 = /
       label-mounted = %{F#${config.colorScheme.colors.base0E}}%{F-} %{F#${config.colorScheme.colors.base0E}}%percentage_used%%%{F-}
       label-unmounted = %mountpoint% not mounted
       label-unmounted-foreground = #${config.colorScheme.colors.base0F}

      [module/memory]
       type = internal/memory
       interval = 2
       format = %{F#${config.colorScheme.colors.base0E}}󰟁 <label>%%{F-}
       label = %percentage_used%
       format-foreground = #${config.colorScheme.colors.base0E}

      [module/cpu]
       type = internal/cpu
       interval = 2
       format = %{F#${config.colorScheme.colors.base0E}} <label>%%{F-}
       label = %percentage%
       format-foreground = #${config.colorScheme.colors.base0E}

      [network-base]
       type = internal/network
       interval = 5
       format-connected = %{F#${config.colorScheme.colors.base0E}}󰇧%{F-} %{F#${config.colorScheme.colors.base0E}}Connected%{F-}
       format-disconnected = :/ Disconnected
       label-disconnected = %{F#${config.colorScheme.colors.base0E}}%ifname%%{F#${config.colorScheme.colors.base0E}} disconnected%{F-}

      [module/wlan]
       inherit = network-base
       interface-type = wireless
       label-connected =   %essid% 

      [module/eth]
       inherit = network-base
       interface-type = wired
       label-connected = %{F#${config.colorScheme.colors.base0E}}%ifname%%{F-}

       [module/pulseaudio]
       type = internal/pulseaudio
       format-volume = <ramp-volume> <label-volume>
       label-muted = 󰖁 muted
       ramp-volume-foreground = #${config.colorScheme.colors.base0E}
       label-volume-foreground = #${config.colorScheme.colors.base0E}
       label-muted-foreground = #${config.colorScheme.colors.base0A}
       ramp-volume-0 = 
       ramp-volume-1 = 
       ramp-volume-2 = 
       click-right = pavucontrol
       scroll-up = notify-send Volume %percentage%%
       scroll-down = notify-send Volume %percentage%%
   
       [module/date]
       type = internal/date
       interval = 1
       date = %H:%M:%S
       date-alt = Data: %d/%m/%Y Hora: %H:%M:%S
       label = %date% 
       label-foreground = #${config.colorScheme.colors.base00}

       [module/xkeyboard]
       type = internal/xkeyboard
       blacklist-0 = num lock
       label-layout = 󰌌 %layout% 
       label-layout-foreground = #${config.colorScheme.colors.base0E}
       label-indicator-on-capslock =   Caps lock
       label-indicator-off-capslock =   Caps lock
       label-indicator-on-capslock-foreground = #${config.colorScheme.colors.base0E}
       label-indicator-off-capslock-foreground = #${config.colorScheme.colors.base0E}
       label-indicator-padding = 2
       label-indicator-margin = 1
       label-indicator-foreground = #${config.colorScheme.colors.base0E}
       label-indicator-background = #${config.colorScheme.colors.base0E}

    '';
  };
}
