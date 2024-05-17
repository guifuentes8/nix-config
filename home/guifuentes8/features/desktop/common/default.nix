{ pkgs, outputs, unstable, ... }:

{
  imports = [ ./chromium.nix ./firefox.nix ];

  programs = { obs-studio.enable = true; };

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  home.packages = [
    pkgs.bitwarden
    pkgs.discord
    pkgs.gimp
    pkgs.onlyoffice-bin
    pkgs.slack

    pkgs.ventoy-bin
    pkgs.etcher
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
    pkgs.xdotool
    pkgs.xorg.xprop
  ];

}
