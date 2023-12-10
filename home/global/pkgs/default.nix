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

  home.packages = with pkgs; [
    bitwarden
    figma-linux
    slack
    telegram-desktop
    whatsapp-for-linux
    onlyoffice-bin
    gimp
    inkscape

    # Usb media
    etcher
    ventoy-bin

    # System Dependencies
    appimage-run
    ffmpeg
    pciutils
    pulseaudio
    unrar
    unzip
  ];

}
