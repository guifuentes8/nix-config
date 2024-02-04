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
    script = "polybar workspaces &";
    config = {

      "settings" = {
        format-padding = 1;
        format-offset-y = "2%";
      };
      "bar/workspaces" = {
        width = "100%";
        height = "24pt";
        radius-bottom-left = 16;
        radius-bottom-right = 16;
        padding-left = 1;
        padding-right = 1;
        offset-y = "0";
        offset-x = "0";
        bottom = false;
        fixed-center = true;
        background = "#CC${config.colorScheme.colors.base00}";
        foreground = "#${config.colorScheme.colors.base05}";
        line-size = "0pt";
        line-color = "#${config.colorScheme.colors.base0C}";
        border-size = "0pt";
        border-color = "#${config.colorScheme.colors.base0C}";
        separator = "";
        separator-foreground = "#${config.colorScheme.colors.base0D}";
        cursor-click = "pointer";
        cursor-scroll = "ns-resize";
        enable-ipc = true;
        wm-restack = "bspwm";
        tray-position = "right";
        tray-background = "#CC${config.colorScheme.colors.base00}";

        font-0 = "MonoLisa Nerd Font:size=12";
        font-1 = "MonoLisa Nerd Font:size=14";

        modules-left = [ "spotify-lyrics" ];
        modules-center = [ "xworkspaces" ];
        modules-right = [
          "filesystem"
          "memory"
          "cpu"
          "temperature"
          "temperature2"
          "wlan"
          "eth"
          "pulseaudio"
          "date"
        ];

      };

      "module/xworkspaces" = {
        type = "internal/xworkspaces";
        label-active = "%name%";
        label-active-foreground = "#${config.colorScheme.colors.base0A}";
        label-active-background = "#CC${config.colorScheme.colors.base00}";
        label-active-underline = "#${config.colorScheme.colors.base0C}";
        label-active-padding = 1;
        label-active-font = 2;
        label-occupied = "%name%";
        label-occupied-foreground = "#${config.colorScheme.colors.base0E}";
        label-occupied-padding = 1;
        label-occupied-font = 2;
        label-urgent = "%name%";
        label-urgent-background = "#CC${config.colorScheme.colors.base00}";
        label-urgent-foreground = "#${config.colorScheme.colors.base05}";
        label-urgent-padding = 1;
        label-empty = "%name%";
        label-empty-foreground = "#${config.colorScheme.colors.base0B}";
        label-empty-padding = 1;
        label-empty-font = 2;
      };

      "module/spotify-lyrics" = {
        type = "custom/script";
        exec = "${pkgs.sptlrx}/bin/sptlrx pipe";
        tail = true;
        label =
          "%{F#${config.colorScheme.colors.base0B}}󰫢 󰍰 %output:0:40...% ";
        format = "<label>";
        format-background = "#CC${config.colorScheme.colors.base00}";
      };

      "module/filesystem" = {
        type = "internal/fs";
        interval = "25";
        mount-0 = "/";
        label-mounted =
          "%{F#${config.colorScheme.colors.base05}}%{F-} %{F#${config.colorScheme.colors.base05}}%percentage_used%%%{F-}";
        label-unmounted = "%mountpoint% not mounted";
        label-unmounted-foreground = "#${config.colorScheme.colors.base0D}";
      };
      "module/memory" = {
        type = "internal/memory";
        interval = "2";
        format = "%{F#${config.colorScheme.colors.base05}}󰟁 <label>%%{F-}";
        label = "%percentage_used%";
        format-foreground = "#${config.colorScheme.colors.base05}";
      };
      "module/cpu" = {
        type = "internal/cpu";
        interval = "2";
        format = "%{F#${config.colorScheme.colors.base05}} <label>%%{F-}";
        label = "%percentage%";
        format-foreground = "#${config.colorScheme.colors.base05}";
      };
      "module/temperature" = {
        type = "internal/temperature";
        interval = "0.5";
        thermal-zone = 0;
        hwmon-path =
          "/sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input";
        base-temperature = 20;
        warn-temperature = 70;
        format = "%{F#${config.colorScheme.colors.base05}}<label>%{F-}";
        format-warn = "%{F#${config.colorScheme.colors.base08}}<label>%{F-}";
        label = " %temperature-c%";
        label-warn = " %temperature-c%";
      };

      "module/temperature2" = {
        type = "internal/temperature";
        interval = "0.5";
        thermal-zone = 0;
        hwmon-path =
          "/sys/devices/platform/coretemp.1/hwmon/hwmon3/temp1_input";
        base-temperature = "20";
        warn-temperature = "70";
        format = "%{F#${config.colorScheme.colors.base05}}<label>%{F-}";
        format-warn = "%{F#${config.colorScheme.colors.base08}}<label>%{F-}";
        label = " %temperature-c%";
        label-warn = " %temperature-c%";
      };
      "network-base" = {
        type = "internal/network";
        interval = "5";
        format-connected =
          "%{F#${config.colorScheme.colors.base05}}󰇧%{F-} %{F#${config.colorScheme.colors.base05}}Connected%{F-}";
        format-disconnected = ":/ Disconnected";
        label-disconnected =
          "%{F#${config.colorScheme.colors.base08}}%ifname%%{F#${config.colorScheme.colors.base08}} disconnected%{F-}";
      };
      "module/wlan" = {
        "inherit" = "network-base";
        interface-type = "wireless";
        label-connected = "  %essid%";
      };
      "module/eth" = {
        "inherit" = "network-base";
        interface-type = "wired";
        label-connected =
          "%{F#${config.colorScheme.colors.base05}}%ifname%%{F-}";
      };
      "module/pulseaudio" = {
        type = "internal/pulseaudio";
        format-volume = "<ramp-volume> <label-volume>";
        label-muted = "󰖁 muted";
        ramp-volume-foreground = "#${config.colorScheme.colors.base05}";
        label-volume-foreground = " #${config.colorScheme.colors.base05}";
        label-muted-foreground = "#${config.colorScheme.colors.base08}";
        ramp-volume-0 = "";
        ramp-volume-1 = "";
        ramp-volume-2 = " ";
        click-right = "pavucontrol";
        scroll-up = "notify-send Volume %percentage%%";
        scroll-down = "notify-send Volume %percentage%%";
      };
      "module/date" = {
        type = "internal/date";
        interval = "1";
        date = "%H:%M:%S";
        date-alt = "Data: %d/%m/%Y Hora: %H:%M:%S";
        label = "%date%";
        label-foreground = "#${config.colorScheme.colors.base0B}";
      };
      #  "module/xkeyboard"={
      #   type = internal/xkeyboard;
      #   blacklist-0 = num lock;
      #   label-layout = 󰌌 %layout% ;
      #   label-layout-foreground = #${config.colorScheme.colors.base0D};
      #   label-indicator-on-capslock =   Caps lock;
      #   label-indicator-off-capslock =   Caps lock;
      #   label-indicator-on-capslock-foreground = #${config.colorScheme.colors.base0D};
      #   label-indicator-off-capslock-foreground = #${config.colorScheme.colors.base0D};
      #   label-indicator-padding = 2;
      #   label-indicator-margin = 1;
      #   label-indicator-foreground = #${config.colorScheme.colors.base0D};
      #   label-indicator-background = #${config.colorScheme.colors.base0D};
      #};
    };

  };
}
