{ pkgs, config, ... }: {
  environment.etc."nextcloud-admin-pass".text = "Agorajaera@123";

  services.nextcloud = {
    enable = true;
    config = {
      overwriteProtocol = "http";
      defaultPhoneRegion = "BR";
      trustedProxies = [ "localhost" "127.0.0.1" ];
      extraTrustedDomains = [ "pokecenter" "192.168.0.10" ];
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbname = "nextcloud";
      adminpassFile = "/etc/nextcloud-admin-pass";
      adminuser = "admin";
    };
    datadir = "/run/media/guifuentes8/pokestorage/nextcloud";
    home = "/run/media/guifuentes8/pokestorage/nextcloud";

    poolSettings = {
      pm = "dynamic";
      "pm.max_children" = "550";
      "pm.max_spare_servers" = "200";
      "pm.min_spare_servers" = "96";
      "pm.start_servers" = "96";
      "pm.process_idle_timeout" = "5s";
    };
    extraOptions = { };
    package = pkgs.nextcloud29; # Need to manually increment with every update
    hostName = "nextcloud";
    configureRedis = true;
    https = false;
    maxUploadSize = "50G";
    database.createLocally = true;
    autoUpdateApps.enable = false;
    extraAppsEnable = true;
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps)
        bookmarks calendar contacts deck mail maps memories music notes
        onlyoffice tasks;

      cookbook = pkgs.fetchNextcloudApp {
        sha256 = "sha256-XgBwUr26qW6wvqhrnhhhhcN4wkI+eXDHnNSm1HDbP6M=";
        url =
          "https://github.com/nextcloud/cookbook/releases/download/v0.10.2/Cookbook-0.10.2.tar.gz";
        license = "gpl3";
      };
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
      integration_collaboard = pkgs.fetchNextcloudApp {
        sha256 = "sha256-FIHEzq1Q+/45QcARRpJDAwjO0DQLACtqWZ2S7SbUr+k=";
        url =
          "https://github.com/nextcloud-releases/integration_collaboard/releases/download/v1.0.6/integration_collaboard-v1.0.6.tar.gz";
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

  systemd.services."nextcloud-setup" = {
    requires = [ "postgresql.service" ];
    after = [ "postgresql.service" ];
  };

  services.nginx.virtualHosts."nextcloud".listen = [{
    addr = "127.0.0.1";
    port = 9000;
  }];
  services.nginx.virtualHosts."localhost" = {
    # enableACME = true;
    forceSSL = false;
    locations."/" = {
      proxyPass = "http://localhost:8080";
      proxyWebsockets = true; # needed if you need to use WebSocket
      extraConfig =
        # required when the target is also TLS server with multiple hosts
        "proxy_ssl_server_name on;" +
        # required when the server wants to use HTTP Authentication
        "proxy_pass_header Authorization;";
    };
  };
}
