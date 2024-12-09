{ config, ... }:
let domain = "guifuentes8.com.br";
in {
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    # 9000-9009 -> Dev tools
    # 9010-9019 -> Personal tools
    # 9020-9029 -> Utils tools
    # 9030-9039 -> Server tools
    # 9090-9099 -> Public tools
    virtualHosts = {
      "${domain}" = {
        forceSSL = false;
        enableACME = false;
        default = true;
        serverAliases = [ "guifuentes8.com.br" ];
        locations."/.well-known/acme-challenge" = {
          root = "/var/lib/acme/.challenges";
        };
        locations."/" = { proxyPass = "http://localhost:8080"; };
      };
      "git.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9000"; };
      };
      "code.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9001"; };
      };
      "db.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9002"; };
      };
      "draw.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9003"; };
      };

      "cloud.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9010"; };
      };

      "vault.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9011"; };
      };
      "jellyfin.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9012"; };
      };
      "google.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9020"; };
      };
      "convert.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9021"; };
      };
      "yt.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9022"; };
      };
      "torrent.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9023"; };
      };

      "status.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9030"; };
      };
      # Config nginx in writefreely .nix file
      #    forceSSL = true;
      #"blog.${domain}" = {
      #    useACMEHost = "${domain}";
      #    locations."/" = {
      #      proxyPass = "http://localhost:9090";
      #    };
      #  };
      "wiki.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9013"; };
      };
      "docs.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9091"; };
      };
      "${config.services.nextcloud.hostName}".listen = [{
        addr = "127.0.0.1";
        port = 9010;
      }];

      "${config.services.writefreely.host}".listen = [{
        addr = "127.0.0.1";
        port = 9090;
      }];
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "guifuentes8+admin@gmail.com";
    certs."${domain}" = {
      extraDomainNames = [
        "git.${domain}"
        "code.${domain}"
        "db.${domain}"
        "draw.${domain}"
        "cloud.${domain}"
        "vault.${domain}"
        "jellyfin.${domain}"
        "google.${domain}"
        "convert.${domain}"
        "yt.${domain}"
        "torrent.${domain}"
        "status.${domain}"
        "blog.${domain}"
        "docs.${domain}"
        "wiki.${domain}"
      ];
      webroot = "/var/lib/acme/.challenges";
      email = "guifuentes8+admin@gmail.com";
      group = "nginx";
    };
  };

  users.users.nginx.extraGroups = [ "acme" ];

  services.static-web-server = {
    enable = true;
    listen = "[::]:8000";
    root = "/home/guifuentes8/guifuentes8-homepage/out/";
    configuration = { general = { directory-listing = true; }; };
  };

}
