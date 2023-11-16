{ config, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true;
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
        color = "${config.colorScheme.colors.base0C} ${config.colorScheme.colors.base06}";
      };
      colors = {
        alpha = 0.8;
        foreground = "${config.colorScheme.colors.base0C}";
        background = "${config.colorScheme.colors.base00}";
        selection-foreground = "${config.colorScheme.colors.base0C}";
        selection-background = "${config.colorScheme.colors.base00}";
        urls = "${config.colorScheme.colors.base09}";
        regular0 = "${config.colorScheme.colors.base00}";
        regular1 = "${config.colorScheme.colors.base08}";
        regular2 = "${config.colorScheme.colors.base09}";
        regular3 = "${config.colorScheme.colors.base09}";
        regular4 = "${config.colorScheme.colors.base09}";
        regular5 = "${config.colorScheme.colors.base06}";
        regular6 = "${config.colorScheme.colors.base06}";
        regular7 = "${config.colorScheme.colors.base07}";
        bright0 = "${config.colorScheme.colors.base03}";
        bright1 = "${config.colorScheme.colors.base08}";
        bright2 = "${config.colorScheme.colors.base09}";
        bright3 = "${config.colorScheme.colors.base09}";
        bright4 = "${config.colorScheme.colors.base09}";
        bright5 = "${config.colorScheme.colors.base06}";
        bright6 = "${config.colorScheme.colors.base06}";
        bright7 = "${config.colorScheme.colors.base07}";
      };
    };
  };
}
