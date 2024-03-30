{ pkgs, outputs, unstable, ... }:

{

  imports = [ ./kdeconnect.nix ./chromium.nix ./obs-studio.nix ];

  home.packages = [
    pkgs.bitwarden
    pkgs.discord
    pkgs.gimp
    pkgs.onlyoffice-bin
    pkgs.slack
    pkgs.spotify
    pkgs.todoist-electron

    pkgs.ventoy-bin
    pkgs.caffeine-ng
    pkgs.appimage-run
    pkgs.ffmpeg
    pkgs.pciutils
    pkgs.pulseaudio
    pkgs.unrar
    pkgs.unzip

    pkgs.chafa
    pkgs.imagemagick
    pkgs.ffmpegthumbnailer
    pkgs.poppler_utils
    pkgs.gnome-epub-thumbnailer
    pkgs.fontpreview
  ];

}
