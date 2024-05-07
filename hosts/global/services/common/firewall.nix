{ config, ... }: {

  environment.etc."ppp/options".text = "ipcp-accept-remote";
  services.pppd.enable = true;

  networking.firewall = {
    enable = false;
    allowedTCPPorts = [ 80 443 ];
  };

}
