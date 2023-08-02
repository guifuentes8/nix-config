{ pkgs, ... }:
{
  programs.yt-dlp = {
    enable = true;
  };
  home.packages = with pkgs; [
    yewtube
  ];

}
