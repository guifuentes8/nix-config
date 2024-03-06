{ pkgs, outputs, unstable, ... }:

{

  imports = [ ./chromium.nix ./kdeconnect.nix ./obs-studio.nix ];

  home.packages = [

    pkgs.bitwarden
    pkgs.gimp
    pkgs.onlyoffice-bin
    pkgs.slack
    pkgs.discord
    pkgs.spotify
    pkgs.telegram-desktop
    pkgs.ytmdesktop

    pkgs.etcher
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
