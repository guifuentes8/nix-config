{ pkgs, unstable, ... }:

{
  imports = [ ./chromium.nix ./firefox.nix ];

  programs = { obs-studio.enable = true; };

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
    nextcloud-client = {
      enable = true;
      startInBackground = false;
    };
  };

  home.packages = [
    pkgs.bitwarden
    unstable.beeper
    pkgs.discord
    pkgs.gimp
    pkgs.onlyoffice-bin
    pkgs.slack
    unstable.warp-terminal

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
