{ pkgs, ... }:
{
  imports = [
    ./firefox
    ./mpv
  ];

  home.packages = with pkgs; [
    gnome-network-displays
    webcord
  ];
}
