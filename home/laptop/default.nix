{ pkgs, lib, ... }:
{
  imports = [
    ./pkgs

    # Global config (required)
    ../shared

    # Environment (DE and/or WM)
    ../interfaces/WM/shared

    # Wayland or Xorg Packages
    ../interfaces/WM/wayland

  ];


  gtk = {
    cursorTheme = lib.mkDefault {
      size = 18;
    };
  };


}

