{ pkgs, outputs, unstable, ... }:

{

  imports = [
    ./chromium.nix
    ./firefox.nix
    ./kdeconnect.nix
    ./obs-studio.nix
    ./pavucontrol.nix
    ./playerctl.nix
  ];

  home.packages = [

    pkgs.spotify
    pkgs.bitwarden
    pkgs.slack
    pkgs.telegram-desktop
    pkgs.onlyoffice-bin
    pkgs.gimp

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
