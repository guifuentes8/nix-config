{ pkgs, ... }: {

  home.packages = with pkgs; [
    dbeaver
    fragments
    google-chrome
    obs-studio
    onlyoffice-bin
    postman
    pulseaudio
    shotcut
    teamviewer
    vscode

    appimage-run
    ventoy-bin
    ntfs3g
    etcher

    #dev
    nodejs
    nixpkgs-fmt
    yarn


    #dependencies
    ffmpeg
    gvfs
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
