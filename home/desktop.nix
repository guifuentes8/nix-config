{ pkgs, ... }:
{
  imports = [

    # Global config (required)
    ./global

    # # # CHOICE ONE # # #

    # Environment (DE)
    #./interfaces/DE/shared

    #1 ./interfaces/DE/kde
    #2 ./interfaces/DE/gnome
    #./interfaces/DE/kde

    # Environment (WM)
    #3 ./interfaces/WM/shared (CHOICE IF USE DE + WM)
    ./interfaces/WM/shared

    # Wayland or Xorg (if WM is selected)
    # ./interfaces/WM/xorg
    ./interfaces/WM/xorg

    # # # CHOICE ONE # # #
  ];


  # # # WAYLAND ONLY # # #

  # home.sessionVariables = {
  #   #MOZ_ENABLE_WAYLAND = 1; wayland
  # };


  # programs = {
  #   firefox = {
  #     packages = pkgs.firefox-wayland;
  #   };
  # };

  # xdg = {
  #   portal = {
  #     enable = true;
  #     extraPortals = with pkgs; [
  #       xdg-desktop-portal-wlr
  #       xdg-desktop-portal-gtk
  #     ];
  #   };
  # };

  # # # WAYLAND ONLY # # #

}
