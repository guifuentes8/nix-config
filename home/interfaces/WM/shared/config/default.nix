{ pkgs, lib, ... }:
{

  imports = [ ./themes/gtk ./firefox.nix ];

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = lib.mkForce "gnome3";
  };

}
