{ pkgs, config, ... }: {
  environment.etc."nextcloud-admin-pass".text = "Agorajaera@123";

  services.nextcloud = {
    enable = true;
    config = {
      overwriteProtocol = "http";
      defaultPhoneRegion = "BR";
      extraTrustedDomains = ["homelab" "192.168.122.3" ];
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
    https = true;
    database.createLocally = true;
    autoUpdateApps.enable = true;
    extraAppsEnable = true;
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps)
        bookmarks calendar contacts deck mail memories music notes onlyoffice;
      #        tasks = pkgs.fetchNextcloudApp {
      #          sha256 = "sha256-L68ughpLad4cr5utOPwefu2yoOgRvnJibqfKmarGXLw=";
      #          url = "https://github.com/nextcloud/tasks/releases/download/v0.16.0/tasks.tar.gz";
      #          license = "agpl3";
      #        };
      #        timemanager = pkgs.fetchNextcloudApp {
      #          sha256 = "sha256-ez6MdeK6PfhYLeHPhMDcHdkrO4+2zGs+RNdQtSMdJho=";
      #          url = "https://github.com/te-online/timemanager/archive/refs/tags/v0.3.14.tar.gz";
      #          license = "agpl3";
      #        };
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
