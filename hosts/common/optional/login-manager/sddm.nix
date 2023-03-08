{ outputs, pkgs, ... }:
let
  sddm-theme = pkgs.callPackage ../../../../pkgs/sddm-theme { };
in
{
  services.xserver = {
    displayManager = {
      sddm = {
        enable = true;
        theme = "sddm-theme";
      };
    };
  };

  environment.systemPackages = (with pkgs; [
    sddm-theme
  ]);
}
