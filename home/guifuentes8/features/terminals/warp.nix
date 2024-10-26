{ pkgs, ... }:

{
  home.file.".local/share/warp-terminal/themes/catppuccin_mocha.yml".source =
    ./catppuccin_mocha.yml;
  home.packages = [ pkgs.warp-terminal ];

}
