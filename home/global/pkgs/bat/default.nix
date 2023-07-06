{ pkgs, ... }:

{
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
    config = {
      theme = "tokyonight";
    };
    themes = {
      tokyonight = builtins.readFile ./tokyonight_storm.tmTheme;
    };
  };
}