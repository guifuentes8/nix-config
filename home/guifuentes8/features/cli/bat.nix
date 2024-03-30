{ pkgs, ... }: {
  imports = [ ];

  programs = {

    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
      config.theme = "tokyonight";
    };
  };
  xdg.configFile."bat/themes/tokyonight.tmTheme".source = ./tokyonight.tmTheme;
}
