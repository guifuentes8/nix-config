{ pkgs, ... }: {
  home.packages = [
    pkgs.ytdownloader
    pkgs.bitwarden
    pkgs.gnome-epub-thumbnailer
    pkgs.fontpreview
  ];
}
