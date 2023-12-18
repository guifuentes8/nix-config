{ config, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        dpi-aware = "yes";
        font = "Dank Mono:size=8:slant=italic";
        pad = "8x8";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      cursor = {
        color = "${config.colorScheme.colors.base06} ${config.colorScheme.colors.base0D}";
      };
      colors = {
        alpha = 0.8;
        foreground = "${config.colorScheme.colors.base06}";
        background = "${config.colorScheme.colors.base00}";
        selection-foreground = "${config.colorScheme.colors.base06}";
        selection-background = "${config.colorScheme.colors.base01}";
        urls = "${config.colorScheme.colors.base0D}";
        regular0 = "${config.colorScheme.colors.base00}";
        regular1 = "${config.colorScheme.colors.base08}";
        regular2 = "${config.colorScheme.colors.base09}";
        regular3 = "${config.colorScheme.colors.base0A}";
        regular4 = "${config.colorScheme.colors.base0B}";
        regular5 = "${config.colorScheme.colors.base0C}";
        regular6 = "${config.colorScheme.colors.base0D}";
        regular7 = "${config.colorScheme.colors.base05}";
        bright0 = "${config.colorScheme.colors.base03}";
        bright1 = "${config.colorScheme.colors.base08}";
        bright2 = "${config.colorScheme.colors.base09}";
        bright3 = "${config.colorScheme.colors.base0A}";
        bright4 = "${config.colorScheme.colors.base0B}";
        bright5 = "${config.colorScheme.colors.base0C}";
        bright6 = "${config.colorScheme.colors.base0D}";
        bright7 = "${config.colorScheme.colors.base05}";
      };
    };
  };
}
