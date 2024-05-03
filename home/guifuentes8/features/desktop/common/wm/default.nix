{ pkgs, ... }:

{
  programs = { zathura.enable = true; };
  services = { playerctld.enable = true; };

  imports = [
    ./rofi
    ./alacritty.nix
    ./dunst.nix
    ./kitty.nix
    ./qutebrowser.nix
    ./xdg.nix
  ];

  home.packages = with pkgs; [ pavucontrol playerctl ];
}
