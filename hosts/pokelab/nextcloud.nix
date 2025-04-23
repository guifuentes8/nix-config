{ pkgs, config, lib, ... }:
let domain = "guifuentes8.com.br";
in {
  environment.etc."nextcloud-admin-pass".text = "Agorajaera@123";
  environment.etc."nextcloud-whiteboard".text = "JWT_SECRET_KEY=Guigui@@@2035";
  environment.etc."onlyoffice-jwt".text = "JWT_SECRET_KEY=Guigui@@@2035";

  services.cron.enable = true;
  services.phpfpm.phpOptions = ''
    memory_limit = 2048M
    max_execution_time = 500
    opcache.enable = 1
    opcache.memory_consumption = 512
    opcache.interned_strings_buffer = 21
    opcache.max_accelerated_files = 10000
    opcache.revalidate_freq = 1
  '';
  services.nextcloud = {
    enable = true;
    cli.memoryLimit = "2G";
    autoUpdateApps.enable = false;
    appstoreEnable = false;
    hostName = "nextcloud";
    datadir = "/var/lib/storage/nextcloud";
    home = "/var/lib/nextcloud";
    configureRedis = true;
    database.createLocally = true;
    extraAppsEnable = true;
    https = true;
    maxUploadSize = "10G";
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
      dbhost = "/run/postgresql";
      adminpassFile = "/etc/nextcloud-admin-pass";
      adminuser = "root";
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
      "pm.start_servers" = "200";
      "pm.max_spare_servers" = "200";
      "pm.min_spare_servers" = "100";
      "pm.process_idle_timeout" = "3s";
    };
    phpOptions = {
      "opcache.enable" = 1;
      "opcache.memory_consumption" = 512;
      "opcache.interned_strings_buffer" = 32;
      "opcache.max_accelerated_files" = 10000;
      "opcache.revalidate_freq" = 1;
      "opcache.validate_timestamps" = 1;
    };
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps)
        bookmarks calendar cookbook contacts cospend deck files_mindmap maps
        memories music news notes notify_push onlyoffice phonetrack tasks;

      drawio = pkgs.fetchNextcloudApp {
        sha256 = "sha256-V2FoRkbTb55zN1H4ilCHSjds4kOeUu6cFF/QZTQfvyA=";
        url =
          "https://github.com/jgraph/drawio-nextcloud/releases/download/v3.0.4/drawio-v3.0.4.tar.gz";
        license = "gpl3";
      };
      timetracker = pkgs.fetchNextcloudApp {
        sha256 = "sha256-T/YoYkDQkDgZ0bASIgZeCTZr6C/eHV69jrPKLOh0Vqk=";
        url = "https://mtier.org/timetracker/timetracker-0.0.84.tar.gz";
        license = "gpl3";
      };
      timemanager = pkgs.fetchNextcloudApp {
        sha256 = "sha256-k4IybXcrLomIBYZO5BPS7YF7UahtEBOBzMxU7tgX9LA=";
        url =
          "https://github.com/te-online/nextcloud-app-releases/raw/main/timemanager/v0.3.18/timemanager.tar.gz";
        license = "gpl3";
      };
    };
  };

  services.onlyoffice = {
    enable = true;
    port = 9101;
    hostname = "localhost";
    jwtSecretFile = "/etc/nextcloud-admin-pass";
    postgresHost = "/run/postgresql";
  };

}
