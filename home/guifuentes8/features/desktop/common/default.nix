{ pkgs, outputs, unstable, ... }:

{

  imports = [ ./chromium.nix ./kdeconnect.nix ./obs-studio.nix ];

  home.packages = [
    pkgs.bitwarden
    pkgs.discord
    pkgs.gimp
    pkgs.onlyoffice-bin
    pkgs.brave
    pkgs.slack
    pkgs.spotify
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
