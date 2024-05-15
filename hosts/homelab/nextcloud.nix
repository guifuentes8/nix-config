{ pkgs, config, ... }: {
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_15;
    ensureDatabases = [ "nextcloud" ];
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      local all      all    trust
      # ipv4
      host  all      all     127.0.0.1/32   trust
      # ipv6
      host all       all     ::1/128        trust
    '';
  };

  services = {
    nextcloud = {
      enable = true;
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

      config = {
        overwriteProtocol = "http";
        defaultPhoneRegion = "BR";
        extraTrustedDomains =
          [ "homelab" "nextcloud.ts.net" "100.88.0.111" "192.168.0.8" ];
        trustedProxies = [ ];
        dbtype = "pgsql";
        dbuser = "nextcloud";
        dbname = "nextcloud";
        adminpassFile = "/etc/nextcloud-admin-pass";
        adminuser = "admin";
      };
    };
  };
  environment.etc."nextcloud-admin-pass".text = "gj8uoV9xKd9Teu";

  systemd.services."nextcloud-setup" = {
    requires = [ "postgresql.service" ];
    after = [ "postgresql.service" ];
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
  networking.search = [ "nextcloud.ts.net" ];
  networking.interfaces.enp3s0.useDHCP = false;
  networking.interfaces.enp3s0.ipv4.addresses = [{
    address = "192.168.0.8";
    prefixLength = 24;
  }];
  networking.defaultGateway = "192.168.0.1";
  networking.nameservers = [ "100.100.100.100" "8.8.8.8" "8.8.4.4" ];

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [ "100.100.100.100" "8.8.8.8" "8.8.4.4" ];
    dnsovertls = "true";
  };

}
