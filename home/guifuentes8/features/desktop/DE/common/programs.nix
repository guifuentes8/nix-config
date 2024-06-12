{ pkgs, ... }:

{
  imports = [ ./chromium.nix ./firefox.nix ];

  home.packages = [
    pkgs.bitwarden
    pkgs.warp-terminal

    pkgs.gnome-epub-thumbnailer
    pkgs.fontpreview
  ];

}
