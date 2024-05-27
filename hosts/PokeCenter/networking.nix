{ config, ... }: {

  networking = {
    search = [ "nextcloud" ];

    defaultGateway = "192.168.0.1";
    interfaces.enp1s0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.0.10";
        prefixLength = 24;
      }];

    };
    nameservers = [ "100.100.100.100" "8.8.8.8" "8.8.4.4" ];
    firewall = {
      trustedInterfaces = [ "enp1s0" "tailscale0" ];
      allowedUDPPorts = [ config.services.tailscale.port 8096 ];
      allowedTCPPorts = [ 22 80 443 8096 ];
    };
  };

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = config.networking.nameservers;
    dnsovertls = "true";
  };
}
