{ config, ... }: {

  networking = {
    search = [ "nextcloud.ts.net" ];
    interfaces.enp1s0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.122.3";
        prefixLength = 24;
      }];
    };
defaultGateway = "192.168.122.1";
    nameservers = [ "100.100.100.100" "8.8.8.8" "8.8.4.4" ];
    firewall = {
      enable = true;
      trustedInterfaces = ["enp1s0" "tailscale0" ];
      allowedUDPPorts = [ config.services.tailscale.port ];
      allowedTCPPorts = [ 22 80 443 ];
    };
  };

services.resolved = {
enable = true;
dnssec = "true";
domains = ["~."];
fallbackDns = config.networking.nameservers;
dnsovertls = "true";
};
}