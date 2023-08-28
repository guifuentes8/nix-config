{ ... }:
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 993 465 57621 ];
    allowedUDPPortRanges = [
      { from = 4000; to = 4007; }
      { from = 8000; to = 8010; }
      { from = 5353; to = 5353; }
    ];
  };
}
