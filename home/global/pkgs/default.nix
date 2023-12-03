{ pkgs, outputs, unstable, ... }:
{

  imports = [
    ./bat
    ./caffeine
    ./chrome
    # ./davinci-resolve # error in build, waiting fix
    ./gh
    ./git
    ./gpg
    ./languages
    ./lsd
    ./ssh

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
