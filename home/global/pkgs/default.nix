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
    ./qutebrowser
    ./ssh
    ./neovim
    ./obs-studio
    ./vscode
    ./zsh
  ];

  home.packages = with pkgs; [


    # TODO: organizar melhor todos esses programas (tentar centralizar e separar as coisas)
    bitwarden
    figma-linux
    insomnia

    # Chat
    discord
    slack
    telegram-desktop
    whatsapp-for-linux

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
