{ pkgs, ... }:
{
  imports = [

    # Global config (required)
    ./global

    # Environment (DE)
    ./interfaces/DE/shared/pkgs
    ./interfaces/DE/kde

    # Environment (WM)
    #./interfaces/WM/shared


    # Wayland or Xorg (if WM is selected)
    # ./interfaces/WM/xorg


  ];

  home.sessionVariables = {
    TZ = "America/Sao_Paulo";
    #MOZ_ENABLE_WAYLAND = 1; wayland
  };

  # Wayland

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
}
