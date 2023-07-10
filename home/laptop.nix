{ pkgs, lib, ... }:
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
  };

  programs = {
    firefox = {
      package = pkgs.firefox-wayland;
    };
  };

  gtk = {
    cursorTheme = lib.mkDefault {
      size = 18;
    };
  };


}

