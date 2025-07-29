{ config, pkgs, lib, ... }:
let
  domain = "sun.mau-becrux.ts.net";
  localDomain = "localhost";
in {
  services.seafile = {
    enable = true;
    seahubPackage = pkgs.unstable.seahub;
    dataDir = "/var/lib/storage/seafile/data";
    adminEmail = "guifuentes8@gmail.com";
    initialAdminPassword = "Agorajaera@123";
    ccnetSettings.General = { SERVICE_URL = "https://${domain}"; };
    seafileSettings.fileserver = {
      host = "${localDomain}";
      port = 9009;
    };
    seahubAddress = "${localDomain}:9010";
    seahubExtraConf = ''
      ALLOWED_HOSTS = ['${domain}', '${localDomain}']
      CSRF_TRUSTED_ORIGINS = ['https://${domain}', 'http://${localDomain}']
      FILE_SERVER_ROOT = 'https://${domain}/seafhttp'
    '';
    gc = {
      enable = true;
      dates = [ "Sun 03:00:00" ];
    };
    workers = 12;
  };
  networking.firewall.allowedTCPPorts = [ 9009 9010 ];
}

