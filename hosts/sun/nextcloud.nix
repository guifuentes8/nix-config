{ pkgs, config, unstable, ... }: {
  environment.etc."nextcloud-admin-pass".text = "Agorajaera@123";
  environment.etc."nextcloud-whiteboard".text = "JWT_SECRET_KEY=Guigui@@@2035";

  services.nextcloud-whiteboard-server = {
    enable = true;
    settings = { NEXTCLOUD_URL = "https://cloud.guifuentes8.com.br"; };
    secrets = [ "/etc/nextcloud-whiteboard" ];
  };
  services.nextcloud = {
    enable = true;
    autoUpdateApps.enable = false;
    appstoreEnable = false;
    hostName = "nextcloud";
    datadir = "/mnt/storage/nextcloud";
    configureRedis = true;
    database.createLocally = true;
    extraAppsEnable = true;
    https = true;
    maxUploadSize = "50G";
    package = pkgs.nextcloud30; # Need to manually increment with every update
    caching = {
      memcached = true;
      redis = true;
      apcu = true;
    };
    config = {
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbname = "nextcloud";
      adminpassFile = "/etc/nextcloud-admin-pass";
      adminuser = "admin";
    };
    settings = {
      overwriteProtocol = "https";
      trusted_proxies = [ "localhost" "127.0.0.1" ];
      trusted_domains = [ "cloud.guifuentes8.com.br" ];
      defaultPhoneRegion = "BR";
      enabledPreviewProviders = [
        "OC\\Preview\\BMP"
        "OC\\Preview\\GIF"
        "OC\\Preview\\JPEG"
        "OC\\Preview\\Krita"
        "OC\\Preview\\MarkDown"
        "OC\\Preview\\MP3"
        "OC\\Preview\\OpenDocument"
        "OC\\Preview\\PNG"
        "OC\\Preview\\TXT"
        "OC\\Preview\\XBitmap"
        "OC\\Preview\\HEIC"
      ];
    };
    poolSettings = {
      pm = "dynamic";
      "pm.max_children" = "500";
      "pm.start_servers" = "192";
      "pm.max_spare_servers" = "192";
      "pm.min_spare_servers" = "96";
      "pm.process_idle_timeout" = "5s";
    };
    phpOptions = {

    };
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps)
        bookmarks calendar contacts cospend deck files_mindmap
        integration_openai integration_paperless mail maps memories music news
        notes notify_push onlyoffice phonetrack richdocuments spreed tasks
        whiteboard;

      drawio = unstable.fetchNextcloudApp {
        sha256 = "sha256-PpCOhegzJ6Suy040r1XwxWzBKmL9xkgEXLaWPKGmvlE=";
        url =
          "https://github.com/jgraph/drawio-nextcloud/releases/download/v3.0.3/drawio-v3.0.3.tar.gz";
        license = "gpl3";
      };
      #      
      tables = unstable.fetchNextcloudApp {
        sha256 = "sha256-0+CZqw2iRxJ2dZtaqJ2RPpfv1Pe8NwmrAr1zkvTFsf8=";
        url =
          "https://github.com/nextcloud-releases/tables/releases/download/v0.8.0/tables-v0.8.0.tar.gz";
        license = "gpl3";
      };

    };
  };

}
