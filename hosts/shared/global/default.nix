# This file (and the global directory) holds config that i use on all hosts
{ lib, inputs, outputs, pkgs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./locale.nix
    ./nix.nix
  ];

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  services.dbus.enable = true;
  services.dbus.packages = [ pkgs.gcr ];


}
