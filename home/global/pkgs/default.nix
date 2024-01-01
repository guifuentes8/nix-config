{ pkgs, outputs, unstable, ... }:
let dbgate = outputs.packages.${pkgs.system}.dbgate;

in {

  imports = [ ./configFiles ];

  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
      config.theme = "material_deep_ocean";
    };
    firefox.enable = true;
    chromium.enable = true;
    chromium.package = pkgs.google-chrome;
    obs-studio.enable = true;

    # System Dependencies
    gpg.enable = true;
    jq.enable = true;
    lsd.enable = true;
    ssh.enable = true;

  };

  home.packages = [

    dbgate
    pkgs.bitwarden
    pkgs.figma-linux
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
