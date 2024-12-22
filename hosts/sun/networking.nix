{ ... }: {

  networking = {
    hostName = "sun";
    defaultGateway = "192.168.0.1";
    interfaces.enp4s0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.0.10";
        prefixLength = 24;
      }];
    };
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
    firewall = {
      trustedInterfaces = [ ];
      allowedUDPPorts = [ 80 443 51413 ];
      allowedTCPPorts = [ 80 443 51413 ];
    };
  };

}
