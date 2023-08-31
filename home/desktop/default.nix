{ pkgs, ... }:


{
  imports = [
    ./pkgs

    # Global config (required)
    ../shared


    # Environment (DE)
    ../interfaces/DE/shared
    ../interfaces/DE/gnome
    #1 ./interfaces/DE/kde
    #2 ./interfaces/DE/gnome

    # Environment (WM)
    #3 ./interfaces/WM/shared (CHOICE IF USE DE + WM)
    ../interfaces/WM/shared
    ../interfaces/WM/xorg

    # Wayland or Xorg (if WM is selected)
    # ./interfaces/WM/wayland

  ];
}
