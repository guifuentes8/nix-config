{ pkgs, config, ... }: {
  environment.etc."nextcloud-admin-pass".text = "Agorajaera@123";

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
    package = pkgs.nextcloud29; # Need to manually increment with every update
    caching = {
      memcached = true;
      redis = true;
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
      pm = "static";
      "pm.max_children" = "55";
      "pm.max_requests" = "448";
      "pm.start_servers" = "192";
      "pm.max_spare_servers" = "192";
      "pm.min_spare_servers" = "96";
      "pm.process_idle_timeout" = "5s";
    };
    phpOptions = {
      catch_workers_output = "yes";
      display_errors = "stderr";
      error_reporting = "E_ALL & ~E_DEPRECATED & ~E_STRICT";
      expose_php = "Off";
      "opcache.enable" = "1";
      "opcache.fast_shutdown" = "1";
      "opcache.interned_strings_buffer" = "12";
      "opcache.max_accelerated_files" = "65406";
      "opcache.memory_consumption" = "512";
      "opcache.revalidate_freq" = "1";
      output_buffering = "0";
      short_open_tag = "Off";
    };
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps)
        bookmarks calendar contacts cospend deck integration_openai
        integration_paperless mail maps memories music notes notify_push
        onlyoffice phonetrack tasks;

      drawio = pkgs.fetchNextcloudApp {
        sha256 = "sha256-PpCOhegzJ6Suy040r1XwxWzBKmL9xkgEXLaWPKGmvlE=";
        url =
          "https://github.com/jgraph/drawio-nextcloud/releases/download/v3.0.3/drawio-v3.0.3.tar.gz";
        license = "gpl3";
      };
      health = pkgs.fetchNextcloudApp {
        sha256 = "sha256-JsmflNU/XIa46NJwdJ5xzjrBk3gI7mTthyqNJ5jhO1g=";
        url =
          "https://github.com/nextcloud/health/releases/download/v2.2.2/health.tar.gz";
        license = "gpl3";
      };

      news = pkgs.fetchNextcloudApp {
        sha256 = "sha256-nj1yR2COwQ6ZqZ1/8v9csb/dipXMa61e45XQmA5WPwg=";
        url =
          "https://github.com/nextcloud/news/releases/download/25.0.0-alpha8/news.tar.gz";
        license = "gpl3";
      };
      tables = pkgs.fetchNextcloudApp {
        sha256 = "sha256-0+CZqw2iRxJ2dZtaqJ2RPpfv1Pe8NwmrAr1zkvTFsf8=";
        url =
          "https://github.com/nextcloud-releases/tables/releases/download/v0.8.0/tables-v0.8.0.tar.gz";
        license = "gpl3";
      };

      timemanager = pkgs.fetchNextcloudApp {
        sha256 = "sha256-fpShR1tF6E0zvlZkV4+LmPqlmOjhzhFDpVxEGPuNQo8=";
        url =
          "https://github.com/te-online/nextcloud-app-releases/raw/main/timemanager/v0.3.15/timemanager.tar.gz";
        license = "gpl3";
      };
    };
  };

}
