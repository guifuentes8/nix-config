{ pkgs, ... }:

{
  imports = [

    # Global config (required)
    ./global

    # Optional pkgs
    ./global/pkgs/dev
    ./global/pkgs/opt/davinci-resolve

    # Environment (DE)
    #1 ./interfaces/DE/kde.nix
    #2 ./interfaces/DE/gnome.nix


    # Wayland or Xorg (if WM is selected)
    # ./interfaces/WM/wayland
    ./global/interfaces/WM/bspwm.nix
  ];

}
