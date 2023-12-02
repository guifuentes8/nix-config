{ pkgs, outputs, unstable, ... }:
{

  imports = [
    ./bat
    ./caffeine
    # ./davinci-resolve # error in build, waiting fix
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
    bitwarden
    discord
    figma-linux
    insomnia
    slack
    telegram-desktop
    vivaldi

    # Usb media
    etcher
    ntfs3g # necessary to detected windows in grub
    ventoy-bin

    # Dev ----

    #javascript
    nodejs
    yarn

    #nix
    nixpkgs-fmt

    #java
    openjdk17-bootstrap
    maven

    # Extra Dependencies
    appimage-run
    ffmpeg
    jq
    ntfs3g
    pciutils
    pulseaudio
    sqlite
    unrar
    unzip
  ];

}
