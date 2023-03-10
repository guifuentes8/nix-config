{ pkgs, ... }:
{

  home.packages = with pkgs; [
    rofi-rbw
    rbw
    pinentry
  ];

  xdg.configFile."rofi-rbw.rc" = {
    source = ./rofi-rbw.rc;
  };
}
