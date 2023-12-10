{ pkgs, lib, ... }:
{
  imports = [

    # Global config (required)
    ./global

    # Optional pkgs
    ./global/pkgs/dev

    # Environment (DE and/or WM)
    ./global/interfaces/WM/hyprland.nix

  ];


}

