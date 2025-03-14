{ config, ... }: {
  services.seafile = {
    enable = true;
    adminEmail = "guifuentes8@gmail.com";
    initialAdminPassword = "Agorajaera@123"; # send by expect script
    ccnetSettings = {
      General.SERVICE_URL = "https://cloud.guifuentes8.com.br";
    };
    seafileSettings = {
      fileserver = {
        host = "127.0.0.1";
        port = 9050;
      };
      quota.default = 2;
      history.keep_days = 30;
      library_trash.expire_days = 30;
    };
    seahubExtraConf = ''
      SITE_NAME = 'box.li7g.com'
      SITE_TITLE = 'Box'
      FILE_SERVER_ROOT = 'https://cloud.guifuentes8.com.com/seafhttp'
    '';
  };

}
