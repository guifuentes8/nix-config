{ config, ... }: {

  networking = {
    hostName = "pokelab"; # Define your hostname.
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
      allowedUDPPorts = [ config.services.tailscale.port 53 80 443 51413 ];
      allowedTCPPorts = [ 53 80 443 3000 51413 ];
    };
  };

}
