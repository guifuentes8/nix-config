{
  services.nginx = {
    enable = true;

    # Use recommended settings
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts =
      let
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

      in
      {
        "pokelab.adguard.lan" = proxy 30;
        #  "pokelab.vscode.lan" = proxy 2000;
        "pokelab.gitea.lan" = proxy 3100;
        "pokelab.nextcloud.lan" = proxy 9000;
        "pokelab.lan" = proxy 8082 // { default = true; };
        "pokelab.jellyfin.lan" = proxy 8096;
        "pokelab.transmission.lan" = proxy 9091;

        "bookstack".listen = [
          {
            addr = "100.99.86.96";
            port = 4000;
          }
          {
            addr = "192.168.0.10";
            port = 4000;
          }
        ];

        "nextcloud".listen = [
          {
            addr = "100.99.86.96";
            port = 9000;
          }
          {
            addr = "192.168.0.10";
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
