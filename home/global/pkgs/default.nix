{ pkgs, outputs, unstable, ... }:
{

  imports = [
    ./configFiles
  ];

  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
      config.theme = "tokyonight_night";
    };
    chromium = {
      enable = true;
      package = pkgs.google-chrome;
    };
    obs-studio.enable = true;

    # System Dependencies
    gpg.enable = true;
    jq.enable = true;
    lsd.enable = true;
    ssh.enable = true;

  };


  home.packages = [

    unstable.beekeeper-studio
    pkgs.bitwarden
    pkgs.figma-linux
    pkgs.slack
    pkgs.telegram-desktop
    pkgs.onlyoffice-bin
    pkgs.gimp

    pkgs.# Usb media
    pkgs.etcher
    pkgs.ventoy-bin

    pkgs.# System Dependencies
    pkgs.appimage-run
    pkgs.ffmpeg
    pkgs.pciutils
    pkgs.pulseaudio
    pkgs.unrar
    pkgs.unzip
  ];

}
