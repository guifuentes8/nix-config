{ pkgs, ... }:
{
  imports = [
    ./davinci-resolve
  ];

  home.packages = with pkgs; [

    # Chat ---
    mattermost-desktop
    discord

    # Editors ---
    onlyoffice-bin
    audacity
    gimp
    inkscape

  ];
}
