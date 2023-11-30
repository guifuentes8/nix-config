{ ... }:
{

  environment.etc."ppp/options".text = "ipcp-accept-remote";
  services.pppd.enable = true;

  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "p2p-wl+" "enp4s0" ];
    allowedTCPPorts = [ 80 443 993 465 4070 7236 7250 8010 10443 57621 ];
    allowedUDPPorts = [ 7236 ];
    allowedUDPPortRanges = [
      { from = 4000; to = 4070; }
      { from = 8000; to = 8010; }
      { from = 5353; to = 5353; }
      { from = 32768; to = 60999; }
    ];
  };
}
