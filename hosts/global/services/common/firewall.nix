{ config, ... }: {

  environment.etc."ppp/options".text = "ipcp-accept-remote";
  services.pppd.enable = true;

  networking.firewall = {
    enable = true;
    trustedInterfaces = [ ];
    allowedTCPPorts = [ 5432 53589 ];
    allowedUDPPorts = [ ];
    allowedUDPPortRanges = [{
      from = 32768;
      to = 60999;
    }];
  };

}
