{ pkgs, ... }:
{
  programs.yt-dlp = {
    enable = true;
  };
  home.packages = with pkgs; [
    ytfzf
  ];

  xdg.configFile."ytfzf/conf.sh".source = ./conf.sh;


}
