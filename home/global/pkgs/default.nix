{ pkgs, ... }: {

  home.packages = with pkgs; [
    dbeaver
    fragments
    obs-studio
    onlyoffice-bin
    postman
    pulseaudio
    shotcut
    slack
    teamviewer
    vscode

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
