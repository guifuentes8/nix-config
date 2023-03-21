{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../../programs
    ../../../shared/programs
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
