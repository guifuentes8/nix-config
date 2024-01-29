{ pkgs, outputs, unstable, ... }:
let dbgate = outputs.packages.${pkgs.system}.dbgate;

in {

  imports = [
    ./chrome.nix
    ./firefox.nix
    ./kdeconnect.nix
    ./obs-studio.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./vscode.nix
  ];

  home.packages = [

    dbgate
    pkgs.insomnia
    pkgs.todoist-electron
    pkgs.spotify
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
