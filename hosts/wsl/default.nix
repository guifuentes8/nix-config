# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, inputs, outputs, nix-colors, unstable, ... }:

{
  imports = [

    #   ../global
    #    ../global/services/common
    ../global/users/guifuentes8.nix
  ];

  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {
    inherit inputs outputs nix-colors unstable;
  };
  home-manager.users.guifuentes8 = import ../../home/guifuentes8/windows.nix;

  environment.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    NIXOS_OZONE_WL = "1";
  };

  #nixpkgs.config.spotify.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  nixpkgs.hostPlatform = "x86_64-linux";
  environment.systemPackages = [ pkgs.chromium ];
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
      permittedInsecurePackages = [
        "python-2.7.18.6"
        "electron-12.2.3"
        "electron-19.1.9"
        "electron-24.8.6"
      ];
    };
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
