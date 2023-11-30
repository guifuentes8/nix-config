{ pkgs, lib, ... }:
{
  imports = [

    # Global config (required)
    ../global

    # Environment (DE and/or WM)
    ../global/interfaces/WM/shared

    # Wayland or Xorg Packages
    ../global/interfaces/WM/wayland

  ];


  gtk = {
    cursorTheme = lib.mkDefault {
      size = 18;
    };
  };


}

