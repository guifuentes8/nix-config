{ pkgs, ... }:
{
  imports = [
    ./firefox
    ./mpv
  ];

  home.packages = with pkgs; [
    go2tv
    webcord
  ];
}
