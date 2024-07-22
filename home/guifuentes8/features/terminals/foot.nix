{ config, ... }: {
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        dpi-aware = "no";
        # font =
        #    "${configOptions.styles.font.code}:size=${configOptions.styles.font.size}";
        pad = "8x8";
      };
      mouse = { hide-when-typing = "yes"; };

    };
  };
}
