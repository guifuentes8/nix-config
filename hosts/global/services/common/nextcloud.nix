{ pkgs, config, ... }: {

  networking.firewall.allowedTCPPorts = [ 80 443 ];
  #networking.nat.enable = true;
  networking.interfaces.enp6s0.useDHCP = false;
  networking.interfaces.enp6s0.ipv4.addresses = [{
    address = "192.168.0.15";
    prefixLength = 24;
  }];
  networking.defaultGateway = "192.168.0.1";
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];

  environment.etc."nextcloud-admin-pass".text = "Guigui.2035";

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    https = true;
    configureRedis = true;
    hostName = "localhost";
    database.createLocally = true;
    maxUploadSize = "1G";
    autoUpdateApps.enable = true;
    config = {
      #  dbtype = "pgsql";
      overwriteProtocol = "https";
      adminuser = "guifuentes8";
      adminpassFile = "/etc/nextcloud-admin-pass";
      extraTrustedDomains = [ "192.168.0.15" "localhost" ];
    };
    extraApps = with config.services.nextcloud.package.packages.apps; {
      # List of apps we want to install and are already packaged in
      # https://github.com/NixOS/nixpkgs/blob/master/pkgs/servers/nextcloud/packages/nextcloud-apps.json
      inherit calendar contacts mail notes onlyoffice tasks;

      # Custom app installation example.
    };
    extraAppsEnable = true;
  };

  services.nginx.enable = true;
  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
    forceSSL = false;
    #  enableACME = true;
  };

  #  security.acme = {
  #    acceptTerms = true;
  #    certs = {
  #      ${config.services.nextcloud.hostName}.email = "guifuentes8@gmail.com";
  #    };
  #  };

}
