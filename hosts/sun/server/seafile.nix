{ ... }: {

  services.seafile = {
    enable = true;
    adminEmail = "guifuentes8@gmail.com";
    initialAdminPassword = "Agorajaera@123";
    ccnetSettings.General.SERVICE_URL = "https://cloud.guifuentes8.com.br";
    seafileSettings = {
      quota.default = "50"; # Amount of GB allotted to users
      history.keep_days = "14"; # Remove deleted files after 14 days
      fileserver = {
        host = "http://localhost";
        port = 9009;
      };
    };
    seahubAddress = "localhost:9010";
    seahubExtraConf = ''
      ALLOWED_HOSTS = [ '127.0.0.1', 'cloud.guifuentes8.com.br', 'localhost' ]
      CSRF_COOKIE_SECURE = True
      SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
      SESSION_COOKIE_SECURE = True
      SITE_ROOT = '/'
      FILE_SERVER_ROOT = 'cloud.guifuentes8.com.br/seafhttp'
      USE_X_FORWARDED_HOST = True
    '';
    workers = 12;
    gc = {
      enable = true;
      dates = [ "Sun 03:00:00" ];
    };
  };
}
