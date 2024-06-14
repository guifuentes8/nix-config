{ pkgs, ... }:

{

  home.packages =
    [ pkgs.bitwarden pkgs.gnome-epub-thumbnailer pkgs.fontpreview ];

}
