{ pkgs, ... }:
{
  imports = [
    ./firefox
  ];

  home.packages = with pkgs; [
    webcord
  ];
}
