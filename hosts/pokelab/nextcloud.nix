{ pkgs, config, ... }: {
  environment.etc."nextcloud-admin-pass".text = "Agorajaera@123";

  services.nextcloud = {
    enable = true;
    autoUpdateApps.enable = false;
    appstoreEnable = false;
    caching = {
      memcached = true;
      redis = true;
    };
    config = {
      overwriteProtocol = "http";
      defaultPhoneRegion = "BR";
      trustedProxies = [ "localhost" "127.0.0.1" "192.168.0.10" ];
      extraTrustedDomains = [ "pokelab" "192.168.0.10" "100.70.218.107" ];
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbname = "nextcloud";
      adminpassFile = "/etc/nextcloud-admin-pass";
      adminuser = "admin";
    };
    configureRedis = true;
    datadir = "/var/pokestorage/nextcloud";
    database.createLocally = true;
    extraAppsEnable = true;
    https = false;
    hostName = "nextcloud";
    maxUploadSize = "50G";
    package = pkgs.nextcloud29; # Need to manually increment with every update
    poolSettings = {
      pm = "static";
      "pm.max_children" = "85";
      "pm.max_requests" = "500";
      "pm.start_servers" = "256";
      "pm.max_spare_servers" = "256";
      "pm.min_spare_servers" = "128";
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
        bookmarks calendar contacts deck mail maps memories music notes
        onlyoffice tasks;

      cospend = pkgs.fetchNextcloudApp {
        sha256 = "sha256-QHIxS5uubutiD9Abm/Bzv1RWG7TgL/tvixVdNEzTlxE=";
        url =
          "https://github.com/julien-nc/cospend-nc/releases/download/v1.6.1/cospend-1.6.1.tar.gz";
        license = "gpl3";
      };
      drawio = pkgs.fetchNextcloudApp {
        sha256 = "sha256-GSLynpuodzjjCy272eksudRJj2WlHwq4OntCGHad4/U=";
        url =
          "https://github.com/jgraph/drawio-nextcloud/releases/download/v3.0.2/drawio-v3.0.2.tar.gz";
        license = "gpl3";
      };
      health = pkgs.fetchNextcloudApp {
        sha256 = "sha256-yLH5EpFKL3pto/4kVo9DKnvog8+x9XFXLChpFKqQU1M=";
        url =
          "https://github.com/nextcloud/health/releases/download/v2.2.2/health.tar.gz";
        license = "gpl3";
      };
      thesearchpage = pkgs.fetchNextcloudApp {
        sha256 = "sha256-+SiPBJ+meG2Fuj0UoFS9PMDJArCKE6q0IXhHOFSTPg0=";
        url =
          "https://github.com/callmemagnus/nextcloud-searchpage/releases/download/v1.2.7/thesearchpage.tar.gz";
        license = "gpl3";
      };

      news = pkgs.fetchNextcloudApp {
        sha256 = "sha256-zQOtIcUxa/IRhQLYoJYe5dRqx/Gac2/qCUdY2aZ5EU4=";
        url =
          "https://github.com/nextcloud/news/releases/download/25.0.0-alpha6/news.tar.gz";
        license = "gpl3";
      };
      phonetrack = pkgs.fetchNextcloudApp {
        sha256 = "sha256-V92f+FiS5vZEkq15A51pHoDpUOBfUOEVIcsXdP/rSMQ=";
        url =
          "https://github.com/julien-nc/phonetrack/releases/download/v0.8.1/phonetrack-0.8.1.tar.gz";
        license = "gpl3";
      };
      tables = pkgs.fetchNextcloudApp {
        sha256 = "sha256-GpNQvlvN7g4HmLpQDWrYm2a8W8Md/xqI42wCOAdCwes=";
        url =
          "https://github.com/nextcloud-releases/tables/releases/download/v0.7.2/tables-v0.7.2.tar.gz";
        license = "gpl3";
      };
      timemanager = pkgs.fetchNextcloudApp {
        sha256 = "sha256-ez6MdeK6PfhYLeHPhMDcHdkrO4+2zGs+RNdQtSMdJho=";
        url =
          "https://github.com/te-online/timemanager/archive/refs/tags/v0.3.14.tar.gz";
        license = "gpl3";
      };
      integration_excalidraw = pkgs.fetchNextcloudApp {
        sha256 = "sha256-NZGu6+KxeXQP23brkpkUbrzglDAy1P9dyQEAf7muwKE";
        url =
          "https://github.com/nextcloud-releases/integration_excalidraw/releases/download/v2.1.0/integration_excalidraw-v2.1.0.tar.gz";
        license = "gpl3";
      };
    };
    extraOptions.enabledPreviewProviders = [
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

}
