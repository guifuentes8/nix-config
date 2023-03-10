{ pkgs, ... }:
{

  home.packages = with pkgs; [
    rofi-rbw
    rbw
    pinentry-gnome

  ];

  xdg.configFile."rofi-rbw.rc" = {
    source = ./rofi-rbw.rc;
  };

  programs.rbw.settings.pinentry = "gnome3";

}
