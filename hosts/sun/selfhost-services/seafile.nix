{ config, pkgs, lib, ... }:
let
  domain = "sun.mau-becrux.ts.net";
  localDomain = "127.0.0.1";
  port = "9001";
in {
  services.seafile = {
    enable = true;
    seahubPackage = pkgs.unstable.seahub;
    dataDir = "/var/lib/storage/seafile/data";
    adminEmail = "guifuentes8@gmail.com";
    initialAdminPassword = "Agorajaera@123";
    ccnetSettings.General = { SERVICE_URL = "https://${domain}:${port}"; };
    seafileSettings.fileserver = {
      host = "${localDomain}";
      port = 9100;
    };
    seahubAddress = "${localDomain}:9101";
    seahubExtraConf = ''
      ALLOWED_HOSTS = ['${domain}', '${localDomain}']
      CSRF_TRUSTED_ORIGINS = ['https://${domain}', 'http://${localDomain}']
      FILE_SERVER_ROOT = 'https://${domain}:${port}/seafhttp'

    '';
    gc = {
      enable = true;
      dates = [ "Sun 03:00:00" ];
    };
    workers = 12;
  };
}

