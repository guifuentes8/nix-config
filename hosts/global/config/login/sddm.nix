{ outputs, pkgs, ... }:
let
  sddm-theme = outputs.packages.${pkgs.system}.sddm-theme;
in
{
  services.xserver = {
    enable = true;
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
