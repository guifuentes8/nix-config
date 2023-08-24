{ pkgs, outputs, ... }:
{

  imports = [
    ./bat
    ./caffeine
    ./davinci-resolve
    ./firefox
    ./gh
    ./git
    ./gpg
    ./neovim
    ./obs-studio
    ./qutebrowser
    ./vscode
    ./zsh
  ];

  home.packages = with pkgs; [
    google-chrome
    dbeaver
    krabby
    onlyoffice-bin
    pulseaudio
    discord

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
    davinci-resolve

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
