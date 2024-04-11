{ pkgs, ... }: {
  imports = [ ];

  programs = {

    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
      config.theme = "catppuccinMocha";
    };
  };
  xdg.configFile."bat/themes/catppuccinMocha.tmTheme".source =
    ./catppuccinMocha.tmTheme;
}
