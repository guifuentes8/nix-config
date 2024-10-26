{ config, ... }:
let domain = "guifuentes8.com.br";
in {
  services.nextcloud.settings = {
    trusted_proxies = [ ];
    trusted_domains = [ "nextcloud.${domain}" ];
  };

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts = let
      base = locations: {
        inherit locations;

        forceSSL = false;
        enableACME = false;
      };
      proxy = port:
        base { "/".proxyPass = "http://127.0.0.1:" + toString port + "/"; };
    in {
      # Define example.com as reverse-proxied service on 127.0.0.1:3000
      "${domain}" = proxy 8787 // { default = true; };
      "dashboard.${domain}" = proxy 9092;
      "jellyfin.${domain}" = proxy 8096;
      "nextcloud.${domain}" = proxy 9090;
      "flood.${domain}" = proxy 9091;
      "gitea.${domain}" = proxy 9093;
      "minecraft.${domain}" = proxy 9999;

      "${config.services.nextcloud.hostName}".listen = [{
        addr = "127.0.0.1";
        port = 9090;
      }];

    };
  };

  services.static-web-server = {
    enable = true;
    listen = "[::]:8787";
    #root = "${config.users.users.guifuentes8.home}";
    root = "/tmp/www/";
  };

}
