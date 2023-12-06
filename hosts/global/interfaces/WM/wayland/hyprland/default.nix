{ inputs, pkgs, ... }:
{
  imports = [
    # inputs.hyprland.nixosModules.default
  ];
  programs = {
    hyprland.enable = false;
  };

  environment.systemPackages = (with pkgs; [
    xdg-utils
  ]);

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

}
