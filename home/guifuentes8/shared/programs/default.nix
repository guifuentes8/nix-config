{ pkgs, ... }: {

  home.packages = with pkgs; [
    bitwarden
    dbeaver
    ffmpeg
    fragments
    firefox-devedition-bin
    google-chrome
    obs-studio
    mattermost-desktop
    onlyoffice-bin
    postman
    pulseaudio
    slack
    teamviewer
    tdesktop
    unrar
    unzip
    vscode

    #dev
    nodejs-16_x
    nixpkgs-fmt
    yarn
  ];
}
