{ outputs, pkgs, ... }:
let
  sddm-theme = pkgs.callPackage ../../../../pkgs/sddm-theme { };
in
{
  services.xserver = {
    enable = true;
    displayManager = {
      sddm = {
        enable = true;
        theme = "sddm-theme";
      };
      session = [
        {
          manage = "desktop";
          name = "xsession";
          start = ''exec $HOME/.xsession'';
        }
      ];
    };
  };

  environment.systemPackages = (with pkgs; [
    sddm-theme
  ]);
}
