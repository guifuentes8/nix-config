{ pkgs, ... }:
let
  yarn-16-18 = pkgs.callPackage ./custom/yarn-16-18.nix { };
in
{

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = (with pkgs; [

    bitwarden
    dbeaver
    fragments
    ffmpeg
    google-chrome
    obs-studio
    onlyoffice-bin
    postman
    teamviewer
    vscode

    # Development
    python2
    python38
    gcc
    glxinfo
    sassc
    sqlite
    imagemagick
    unzip
    yt-dlp
    nodejs-16_x
    #nodejs
    docker-compose
    lsof
    nixpkgs-fmt
    yarn-16-18

  ]);


}
