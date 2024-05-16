{ config, ... }: {

  networking = {
    search = [ "nextcloud.ts.net" ];
    interfaces.enp3s0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.0.8";
        prefixLength = 24;
      }];
    };
    defaultGateway = "192.168.0.1";
    nameservers = [ "100.100.100.100" "8.8.8.8" "8.8.4.4" ];
    firewall = {
      enable = true;
      trustedInterfaces = [ "tailscale0" ];
      allowedUDPPorts = [ config.services.tailscale.port ];
      allowedTCPPorts = [ 22 80 443 ];
    };
  };

}
