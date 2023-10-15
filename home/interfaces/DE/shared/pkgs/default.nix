{ pkgs, ... }:
{
  imports = [
    ./firefox
  ];
  home.packages = with pkgs; [
    bitwarden
    spotify
    telegram-desktop

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
