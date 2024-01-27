{ config, ... }: {

  environment.etc."ppp/options".text = "ipcp-accept-remote";
  services.pppd.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 53589 ];
  };

}
