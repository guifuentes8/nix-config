{ outputs, pkgs, ... }:
let
  sddm-theme = pkgs.callPackage ../../../../pkgs/sddm-theme { };
in
{
  imports = [
    ../services/X11.nix
  ];
  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "sddm-theme";
  };

  environment.systemPackages = (with pkgs; [
    sddm-theme
  ]);
}
