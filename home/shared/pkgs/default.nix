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
    ./vscode
    ./zsh
  ];

  home.packages = with pkgs; [

    #Apps
    google-chrome
    slack

    # Usb media
    ventoy-bin
    ntfs3g
    etcher

    # Dev
    #js
    nodejs
    yarn

    #nix
    nixpkgs-fmt

    #java
    openjdk17-bootstrap
    maven

    # Dependencies
    ffmpeg
    jq
    sqlite
    unrar
    unzip
    pciutils
    pulseaudio
    ntfs3g
    appimage-run

  ];

}
