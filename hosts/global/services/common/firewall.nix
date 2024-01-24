{ config, ... }: {

  services.taskserver.enable = true;
  services.taskserver.trust = "allow all";
  services.taskserver.fqdn = "192.168.0.111";
  services.taskserver.listenHost = "::";
  services.taskserver.organisations.personal.users = [ "guifuentes8" ];
  services.openssh.enable = true;
  environment.etc."ppp/options".text = "ipcp-accept-remote";
  services.pppd.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 53589 ];
  };

}
