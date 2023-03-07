{ outputs, pkgs, ... }:
let
  sddm-theme = outputs.packages.${pkgs.system}.sddm-theme;
in
{
  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "sddm-theme";
  };
}
