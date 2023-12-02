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
      };
      mouse = {
        hide-when-typing = "yes";
      };
      cursor = {
        color = "${config.colorScheme.colors.base06} ${config.colorScheme.colors.base0A}";
      };
      colors = {
        alpha = 0.9;
        foreground = "${config.colorScheme.colors.base05}";
        background = "${config.colorScheme.colors.base00}";
        selection-foreground = "${config.colorScheme.colors.base05}";
        selection-background = "${config.colorScheme.colors.base04}";
        urls = "${config.colorScheme.colors.base0A}";
        regular0 = "${config.colorScheme.colors.base03}";
        regular1 = "${config.colorScheme.colors.base08}";
        regular2 = "${config.colorScheme.colors.base0B}";
        regular3 = "${config.colorScheme.colors.base0A}";
        regular4 = "${config.colorScheme.colors.base0D}";
        regular5 = "${config.colorScheme.colors.base09}";
        regular6 = "${config.colorScheme.colors.base0C}";
        regular7 = "${config.colorScheme.colors.base06}";
        bright0 = "${config.colorScheme.colors.base03}";
        bright1 = "${config.colorScheme.colors.base08}";
        bright2 = "${config.colorScheme.colors.base0B}";
        bright3 = "${config.colorScheme.colors.base0A}";
        bright4 = "${config.colorScheme.colors.base0D}";
        bright5 = "${config.colorScheme.colors.base09}";
        bright6 = "${config.colorScheme.colors.base0C}";
        bright7 = "${config.colorScheme.colors.base06}";
      };
    };
  };
}
