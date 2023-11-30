{ pkgs, ... }:

{
  imports = [

    # Global config (required)
    ../global

    # Environment (DE)

    #1 ./interfaces/DE/kde
    #2 ./interfaces/DE/gnome

    # Environment (WM)
    #3 ./interfaces/WM/shared (CHOICE IF USE DE + WM)
    ../global/interfaces/WM/xorg
    ../global/interfaces/WM/shared

    # Wayland or Xorg (if WM is selected)
    # ./interfaces/WM/wayland
  ];

}
