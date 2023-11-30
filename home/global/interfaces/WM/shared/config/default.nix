{ pkgs, lib, ... }:
{

  imports = [ ./themes/gtk ];

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = lib.mkForce "gnome3";
  };

}
