{ pkgs, ... }: {

  home.packages = with pkgs; [
    dbeaver
    fragments
    firefox-devedition-bin
    google-chrome
    obs-studio
    onlyoffice-bin
    postman
    pulseaudio
    shotcut
    teamviewer
    vscode

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

    #dev
    nodejs-16_x
    nixpkgs-fmt
    yarn
  ];

}
