{ pkgs, ... }:
{
  imports = [

  ];
  home.packages = with pkgs; [
    bitwarden
    spotify
    telegram-desktop

    # Chat ---
    discord

    # Editors ---
    onlyoffice-bin
    audacity
    gimp
    inkscape

  ];
}
