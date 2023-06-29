{ pkgs, outputs, ... }:
let shotcut = outputs.packages.${pkgs.system}.shotcut;
in
{

  imports = [
    ./bat
    ./caffeine
    ./firefox
    ./gh
    ./git
    ./gpg
    ./obs
    ./qutebrowser
    ./vscode
    ./zsh
  ];

  home.packages = with pkgs; [
    dbeaver
    fragments
    krabby
    onlyoffice-bin
    postman
    pulseaudio

    # Chat
    mattermost-desktop
    slack

    # Sound
    shortwave
    ytmdl

    # Sound editor
    audacity

    # Image editor
    gimp
    inkscape

    # Video editor
    libsForQt5.kdenlive
    mediainfo
    glaxnimate

    # Usb media
    ventoy-bin
    ntfs3g
    etcher

    # Dev
    nodejs
    yarn
    nixpkgs-fmt

    # Dependencies
    ffmpeg
    jq
    sqlite
    unrar
    unzip

    # Extra
    appimage-run
    ntfs3g
  ];



}
