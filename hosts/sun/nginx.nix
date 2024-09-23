{ ... }:
let
  lanDomain = "192.168.0.10";
  vpnDomain = "100.72.62.112";
in {
  services.bookstack.appURL = "http://${vpnDomain}:4000";
  services.nextcloud.settings = {
    trusted_proxies = [ "sun.nextcloud.lan" ];
    trusted_domains =
      [ "sun" "${lanDomain}" "${vpnDomain}" "localhost" "sun.nextcloud.lan" ];

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

        base {
          "/" = {
            proxyWebsockets = true;
            proxyPass = "http://127.0.0.1:" + toString port + "/";
          };
        };

    in {
      "sun.adguard.lan" = proxy 30;
      "sun.gitea.lan" = proxy 3100;
      "sun.nextcloud.lan" = proxy 9000;
      "sun.lan" = proxy 8082 // { default = true; };
      "sun.jellyfin.lan" = proxy 8096;
      "sun.transmission.lan" = proxy 9091;

      "bookstack".listen = [
        {
          addr = vpnDomain;
          port = 4000;
        }
        {
          addr = lanDomain;
          port = 4000;
        }
      ];

      "nextcloud".listen = [
        {
          addr = vpnDomain;
          port = 9000;
        }
        {
          addr = lanDomain;
          port = 9000;
        }

        {
          addr = "127.0.0.1";
          port = 9000;
        }
      ];
    };
  };

}
