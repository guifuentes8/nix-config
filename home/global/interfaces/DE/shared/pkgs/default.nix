{ pkgs, ... }:
{
  imports = [

  ];
  home.packages = with pkgs; [
    spotify

    # Chat ---

    # Editors ---
    onlyoffice-bin
    audacity
    gimp
    inkscape

  ];
}
