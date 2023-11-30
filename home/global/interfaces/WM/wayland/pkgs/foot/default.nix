{ config, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = false;
    settings = {
      main = {
        term = "xterm-256color";
        dpi-aware = "yes";
        font = "JetBrainsMonoNL Nerd Font:size=8";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      cursor = {
        color = "${config.colorScheme.colors.base06} ${config.colorScheme.colors.base08}";
      };
      colors = {
        alpha = 0.9;
        foreground = "${config.colorScheme.colors.base06}";
        background = "${config.colorScheme.colors.base00}";
        selection-foreground = "${config.colorScheme.colors.base00}";
        selection-background = "${config.colorScheme.colors.base06}";
        urls = "${config.colorScheme.colors.base08}";
        regular0 = "${config.colorScheme.colors.base01}";
        regular1 = "${config.colorScheme.colors.base08}";
        regular2 = "${config.colorScheme.colors.base0B}";
        regular3 = "${config.colorScheme.colors.base0A}";
        regular4 = "${config.colorScheme.colors.base0D}";
        regular5 = "${config.colorScheme.colors.base09}";
        regular6 = "${config.colorScheme.colors.base0C}";
        regular7 = "${config.colorScheme.colors.base06}";
        bright0 = "${config.colorScheme.colors.base01}";
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