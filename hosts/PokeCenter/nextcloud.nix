{ pkgs, config, ... }: {
  environment.etc."nextcloud-admin-pass".text = "Agorajaera@123";

  services.nextcloud = {
    enable = true;
    config = {
      overwriteProtocol = "http";
      defaultPhoneRegion = "BR";
      extraTrustedDomains = [ "pokecenter" "192.168.0.10" ];
      trustedProxies = [ ];
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbname = "nextcloud";
      adminpassFile = "/etc/nextcloud-admin-pass";
      adminuser = "admin";
    };
    package = pkgs.nextcloud28; # Need to manually increment with every update
    hostName = "localhost";
    configureRedis = true;
    https = false;
    maxUploadSize = "50G";
    database.createLocally = true;
    autoUpdateApps.enable = true;
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

}
