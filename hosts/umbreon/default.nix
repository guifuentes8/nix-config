{ config, inputs, outputs, pkgs, ... }:

{

  imports = [ ../common/users/droid.nix ];
  system.stateVersion = "24.05";
  environment.packages = [ pkgs.wget pkgs.unzip ];
}
