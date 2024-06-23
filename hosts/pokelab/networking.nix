{ config, ... }: {

  networking = {
    search = [ "pokelab" ];
    defaultGateway = "192.168.0.1";
    interfaces.enp4s0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.0.10";
        prefixLength = 24;
      }];

    };
    nameservers = [ "100.100.100.100" "8.8.8.8" "8.8.4.4" ];
    firewall = {
      trustedInterfaces = [ "enp4s0" "tailscale0" ];
      allowedUDPPorts = [ config.services.tailscale.port 8096 51413 ];
      allowedTCPPorts = [ 22 80 443 8082 8096 51413 ];
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
