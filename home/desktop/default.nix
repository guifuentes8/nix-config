{ pkgs, ... }:


{
  imports = [
    ./pkgs

    # Global config (required)
    ../shared

    # Environment (DE)

    #1 ./interfaces/DE/kde
    #2 ./interfaces/DE/gnome

    # Environment (WM)
    #3 ./interfaces/WM/shared (CHOICE IF USE DE + WM)
    ../interfaces/DE/gnome
    ../interfaces/DE/shared


    # Wayland or Xorg (if WM is selected)
    # ./interfaces/WM/wayland

  ];
}
