{ config, inputs, outputs, pkgs, ... }:

{

  imports = [ ../common/users/droid.nix ];
  # networking.hostName = "umbreon";
  system.stateVersion = "24.05";
  environment.packages = with pkgs; [ git vim ];

}
