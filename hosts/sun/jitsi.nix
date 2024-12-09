{...}:{
  services.jitsi-meet = {
    enable = true;
    hostName = "jitsi.guifuentes8.com.br";
    };

  services.jitsi-videobridge.openFirewall = true;
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
