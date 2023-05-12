{ config, pkgs, ... }: {

  xsession.windowManager.i3 = {
    enable = true;
    extraConfig = (import ./i3.nix {
      inherit (config);
    });
  };
}
