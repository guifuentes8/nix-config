{ pkgs, lib, ... }:
{

  imports = [ ./gtk.nix ./firefox.nix ];

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = lib.mkDefault "gtk2";
  };


}
