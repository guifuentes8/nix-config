{ ... }: {

  services.seafile = {
    enable = true;
    adminEmail = "example@some.com";
    initialAdminPassword = "pass";
    ccnetSettings.General.SERVICE_URL = "http://localhost:9010";
    seahubAddress = "localhost:9009";
  };
  networking.firewall.allowedTCPPorts = [ 9009 ];
}
