{ pkgs, ... }: {
  imports = [ ];

  programs = {

    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
      config.theme = "catppuccin";
    };
  };
  xdg.configFile."bat/themes/catppuccin.tmTheme".source = ./catppuccin.tmTheme;
}
