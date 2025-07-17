{ config, ... }: {
  services.seafile = {
    enable = true;
    adminEmail = "guifuentes8@gmail.com";
    initialAdminPassword = "Agorajaera@123"; # send by expect script
    ccnetSettings = { General.SERVICE_URL = "http://127.0.0.1:9010"; };
    seafileSettings = {
      fileserver = {
        host = "127.0.0.1";
        port = 9010;
      };
      quota.default = 2;
      history.keep_days = 30;
      library_trash.expire_days = 30;
    };
    seahubAddress = ''
      "[::1]:9010"
    '';
    seahubExtraConf = ''
      SITE_NAME = 'box.li7g.com'
      SITE_TITLE = 'Box'
      FILE_SERVER_ROOT = 'https://cloud.guifuentes8.com.com/seafhttp'
    '';
  };

}
