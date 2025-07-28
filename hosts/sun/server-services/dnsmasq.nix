{ config, lib, pkgs, ... }:

{
  services.dnsmasq = {
    enable = true;
    settings = {
      address = [
        "/sun.mau-becrux.ts.net/100.101.186.113"
        "/photos.sun.mau-becrux.ts.net/100.101.186.113"
      ];
    };
  };

  networking.firewall.allowedUDPPorts = [ 53 ];
}

