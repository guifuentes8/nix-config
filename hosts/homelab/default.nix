# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./nextcloud.nix

    ../global
    ../global/boot/systemd-boot.nix

    ../global/login/lightdm.nix
    ../global/interfaces/WM/bspwm.nix

    ../global/users/guifuentes8.nix
  ];

  # Bootloader.

  networking.hostName = "homelab"; # Define your hostname.

  # Enable automatic login for the user.
  services.getty.autologinUser = "guifuentes8";

}
