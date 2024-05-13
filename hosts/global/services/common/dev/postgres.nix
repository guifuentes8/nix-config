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
      autoUpdateApps.enable = true;

      # appstoreEnable = true;
      extraAppsEnable = true;
      extraApps = with config.services.nextcloud.package.packages.apps; {
        inherit calendar contacts mail notes; #tasks #memories

      };

      # home = "/mnt/Storage/nextcloud";
      datadir = "/mnt/exhd";

      config = {
        overwriteProtocol = "http";
        defaultPhoneRegion = "BR";

        trustedProxies = [ ];

        dbtype = "pgsql";
        dbuser = "nextcloud";
        dbhost = "/run/postgresql"; # nextcloud will add /.s.PGSQL.5432 by itself
        dbname = "nextcloud";
        dbpassFile = "/etc/nextcloud-admin-pass";

        adminpassFile = "/etc/nextcloud-admin-pass";
        adminuser = "admin";
      };
    };
  };

  systemd.services."nextcloud-setup" = {
    requires = [ "postgresql.service" ];
    after = [ "postgresql.service" ];
  };

  environment.etc."nextcloud-admin-pass".text = "gj8uoV9xKd9Teu";

}
