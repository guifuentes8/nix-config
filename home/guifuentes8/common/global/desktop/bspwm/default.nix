{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../common
    ../../programs/wm
    ../../programs/wm/xorg
  ];

  xsession.enable = true;

  xsession.windowManager.bspwm = {
    enable = true;
    package = pkgs.bspwm;
    extraConfig = (import ./bspwm.nix {
      inherit (config);
    });
  };

  services.sxhkd = {
    enable = true;
    package = pkgs.sxhkd;
    extraConfig = (import ./sxhkd.nix {
      inherit (config);
    });
  };
}
