{ ... }: {
  services.seafile = {
    enable = true;

    adminEmail = "guifuentes8@gmail.com";
    initialAdminPassword = "Agorajaera@123"; # send by expect script
    ccnetSettings = { General.SERVICE_URL = "http://127.0.0.1:9010"; };
    seafileSettings = {
      fileserver = {
        host = "unix:/run/seafile/server.sock";
        port = 9010;
      };
      quota.default = "50"; # Amount of GB allotted to users
      history.keep_days = "14"; # Remove deleted files after 14 days
    };
    dataDir = "/var/lib/seafile/data";
    gc = {
      enable = true;
      dates = [ "Sun 03:00:00" ];
    };
    seahubAddress = ''
      "[::1]:9009"
    '';
    seafilePort = 9010;
    seahubPort = 9009;
  };
}
