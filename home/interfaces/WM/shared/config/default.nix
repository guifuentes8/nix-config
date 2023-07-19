{ pkgs, lib, ... }:
{

  imports = [ ./gtk.nix ];

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = lib.mkDefault "gtk2";
  };


}
