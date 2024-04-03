{ config, ... }: {
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        dpi-aware = "no";
        font = "Monolisa:size=11";
        pad = "8x8";
      };
      mouse = { hide-when-typing = "yes"; };
      cursor = {
        color =
          "${config.colorScheme.palette.base05} ${config.colorScheme.palette.base0D}";
      };
      colors = {
        alpha = 0.8;
        foreground = "${config.colorScheme.palette.base05}";
        background = "${config.colorScheme.palette.base00}";
        selection-foreground = "${config.colorScheme.palette.base05}";
        selection-background = "${config.colorScheme.palette.base01}";
        urls = "${config.colorScheme.palette.base0D}";
        regular0 = "${config.colorScheme.palette.base00}";
        regular1 = "${config.colorScheme.palette.base08}";
        regular2 = "${config.colorScheme.palette.base09}";
        regular3 = "${config.colorScheme.palette.base0A}";
        regular4 = "${config.colorScheme.palette.base0B}";
        regular5 = "${config.colorScheme.palette.base0C}";
        regular6 = "${config.colorScheme.palette.base0D}";
        regular7 = "${config.colorScheme.palette.base05}";
        bright0 = "${config.colorScheme.palette.base03}";
        bright1 = "${config.colorScheme.palette.base08}";
        bright2 = "${config.colorScheme.palette.base09}";
        bright3 = "${config.colorScheme.palette.base0A}";
        bright4 = "${config.colorScheme.palette.base0B}";
        bright5 = "${config.colorScheme.palette.base0C}";
        bright6 = "${config.colorScheme.palette.base0D}";
        bright7 = "${config.colorScheme.palette.base05}";
      };
    };
  };
}
