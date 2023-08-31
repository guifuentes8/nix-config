{ inputs, pkgs, ... }:
{
  imports = [
    inputs.hyprland.nixosModules.default
  ];
  programs = {
    hyprland.enable = true;
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };
  };
}
