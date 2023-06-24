{ pkgs, ... }: {

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
    onlyoffice-bin
    postman
    pulseaudio
    shotcut
    slack

    #appimage
    appimage-run

    #usb media
    ventoy-bin
    ntfs3g
    etcher

    #dev
    nodejs
    nixpkgs-fmt
    yarn


    #dependencies
    ffmpeg
    jq
    sqlite
    unrar
    unzip

    #extra
    appimage-run
    ventoy-bin
    ntfs3g
  ];

}
