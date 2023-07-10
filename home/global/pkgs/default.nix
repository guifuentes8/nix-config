{ pkgs, outputs, ... }:
{

  imports = [
    ./bat
    ./caffeine
    ./firefox
    ./gh
    ./git
    ./gpg
    ./obs-studio
    ./qutebrowser
    ./vim
    ./vscode
    ./zsh
  ];

  home.packages = with pkgs; [
    dbeaver
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
    pciutils

    # Extra
    appimage-run
    ntfs3g
  ];

}
