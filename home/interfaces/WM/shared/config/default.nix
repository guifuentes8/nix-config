{ pkgs, lib, ... }:
{

  imports = [ ./gtk.nix ];

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gtk2";
  };


}
