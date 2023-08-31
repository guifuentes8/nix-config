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
    pulseaudio
    ntfs3g
    appimage-run

  ];

}
