{ pkgs, outputs, ... }:
{

  imports = [
    ./bat
    ./caffeine
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

    # Wine

    # support both 32- and 64-bit applications
    wineWowPackages.stable

    # winetricks (all versions)
    winetricks

    # native wayland support (unstable)
    #wineWowPackages.waylandFull
  ];

}
