{ outputs, pkgs, ... }:
# let
# sddm-theme = outputs.packages.${pkgs.system}.sddm-theme;
# in
{
  services.xserver = {
    enable = true;
    displayManager = {
      sddm = {
        enable = true;
        enableHidpi = false;
        autoNumlock = true;
      };
    };
  };

  # environment.systemPackages = (with pkgs; [
  #   sddm-theme
  # ]);
}
