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

  environment.systemPackages = with pkgs; [ anydesk tailscale ];
  networking.firewall = {
    # enable the firewall
    enable = true;

    # always allow traffic from your Tailscale network
    trustedInterfaces = [ "tailscale0" ];

    # allow the Tailscale UDP port through the firewall
    allowedUDPPorts = [ config.services.tailscale.port ];

    # allow you to SSH in over the public internet
    allowedTCPPorts = [ 22 ];
  };

  services.tailscale = {
    enable = true;
    openFirewall = true;
    useRoutingFeatures = "server";
  };

}
