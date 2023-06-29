{ pkgs, ... }:
{
  imports = [
    # Global config (required)
    ./global

    # Environment (DE and/or WM)
    ./interfaces/WM/shared

    # Wayland or Xorg Packages
    ./interfaces/WM/wayland

  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    TZ = "America/Sao_Paulo";
  };

  programs = {
    firefox = {
      packages = pkgs.firefox-wayland;
    };
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };
}
