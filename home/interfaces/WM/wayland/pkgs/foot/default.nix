{ config, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = false;
    settings = {
      main = {
        term = "xterm-256color";
        dpi-aware = "yes";
        font = "JetBrainsMonoNL Nerd Font:size=10";
      };

      cursor = {
        color = "${config.colorScheme.colors.base00} ${config.colorScheme.colors.base0E}";
      };

      colors = {
        alpha = 0.8;
        foreground = "${config.colorScheme.colors.base00}";
        background = "${config.colorScheme.colors.base01}";
        selection-foreground = "${config.colorScheme.colors.base00}";
        selection-background = "${config.colorScheme.colors.base0E}";
        urls = "${config.colorScheme.colors.base0F}";
        regular0 = "${config.colorScheme.colors.base02}";
        regular1 = "${config.colorScheme.colors.base08}";
        regular2 = "${config.colorScheme.colors.base09}";
        regular3 = "${config.colorScheme.colors.base0A}";
        regular4 = "${config.colorScheme.colors.base0B}";
        regular5 = "${config.colorScheme.colors.base0E}";
        regular6 = "${config.colorScheme.colors.base0D}";
        regular7 = "${config.colorScheme.colors.base07}";
        bright0 = "${config.colorScheme.colors.base03}";
        bright1 = "${config.colorScheme.colors.base08}";
        bright2 = "${config.colorScheme.colors.base09}";
        bright3 = "${config.colorScheme.colors.base0A}";
        bright4 = "${config.colorScheme.colors.base0B}";
        bright5 = "${config.colorScheme.colors.base0E}";
        bright6 = "${config.colorScheme.colors.base0D}";
        bright7 = "${config.colorScheme.colors.base07}";
      };
    };
  };
}
