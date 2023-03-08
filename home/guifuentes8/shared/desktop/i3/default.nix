{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../shared
    ../../programs/wm
    ../../programs/wm/xorg
  ];

  xsession.enable = true;
  #xsession.windowManager.i3 = {
  #  enable = true;
  #  package = pkgs.i3;
    #extraConfig = (import ./i3.nix {
      #inherit (config);
    #});
  #};
}
