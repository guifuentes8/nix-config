{ config, ... }:
let domain = "guifuentes8.com.br";
in {
  services.nextcloud.settings = {
    trusted_proxies = [ "localhost" "127.0.0.1" ];
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
      "${domain}" = proxy 8787 // { default = true; };
      "nextcloud.${domain}" = proxy 9090;
      "flood.${domain}" = proxy 9091;
      "dashboard.${domain}" = proxy 9092;
      "gitea.${domain}" = proxy 9093;
      "vscode.${domain}" = proxy 9095;
      "cloudbeaver.${domain}" = proxy 9096;
      "convertx.${domain}" = proxy 9097;
      "metube.${domain}" = proxy 9098;
     "whoogle.${domain}" = proxy 9099;
     "vaultwarden.${domain}" = proxy 8222;
     "jellyfin.${domain}" = proxy 8096;
     "excalidraw.${domain}" = proxy 8089;
      "blog.${domain}" = proxy 8088;
      "${config.services.nextcloud.hostName}".listen = [{
        addr = "127.0.0.1";
        port = 9090;
      }];
          };
  };

  services.static-web-server = {
    enable = true;
      listen = "[::]:8787";
      root = "/home/guifuentes8/guifuentes8-homepage/out/";
      configuration = {
    general = { 
      directory-listing = true;
    };
  };
  };




}
