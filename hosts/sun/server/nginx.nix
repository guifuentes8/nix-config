{ config, ... }:
let
  domain = "guifuentes8.com.br";
  localDomain = "localhost";
  extraConfigSeafile = ''
    proxy_request_buffering off;
    client_max_body_size 0;

  '';
  # 9000-9009 -> Dev tools
  # 9010-9019 -> Personal tools
  # 9020-9029 -> Utils tools
  # 9030-9039 -> Server tools
  # 9090-9099 -> Public tools
in {
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts = {
      "${domain}" = {
        forceSSL = true;
        default = true;
        enableACME = true;
        locations."/" = { proxyPass = "http://${localDomain}:80"; };
        locations."/.well-known/acme-challenge" = {
          root = "/var/lib/acme/acme-challenge";
        };
      };
      "git.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:9000"; };
      };
      "code.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:9001"; };
      };
      "db.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:9002"; };
      };
      "draw.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:9003"; };
      };
      "wiki.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:9004"; };
      };
      "dav.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = {
          proxyPass = "http://${localDomain}:9005";
          extraConfig = ''
            rewrite ^/.well-known/carddav /radicale/ redirect;
            rewrite ^/.well-known/caldav /radicale/ redirect;
          '';
        };
      };

      "cloud.${domain}" = {
        listen = [{
          addr = "${localDomain}";
          port = 9010;
        }];

        locations = {
          "/" = {
            proxyPass = "http://${localDomain}:9101";
            proxyWebsockets = true;
            extraConfig = ''
              ${extraConfigSeafile} 
            '';
          };
          "/seafhttp" = {
            proxyPass = "http://${localDomain}:9100";
            extraConfig = ''
              rewrite ^/seafhttp(.*)$ $1 break;
              ${extraConfigSeafile} 
            '';
          };
        };
      };

      "vault.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:9011"; };
      };
      "jellyfin.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:9012"; };
      };
      "google.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:9020"; };
      };
      "convert.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:9021"; };
      };
      "yt.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:9022"; };
      };
      "torrent.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:9023"; };
      };
      "status.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:9030"; };
      };
      #"blog.${domain}" = {
      # forceSSL = true;
      #       useACMEHost = "${domain}";
      #  locations."/" = { proxyPass = "http://${localDomain}:9090"; };
      # };
      "docsign.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:9091"; };
      };
      "social.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:9092"; };
      };
      "nextcloud-whiteboard.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:9100"; };
      };
      "office.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:9101"; };
      };
      "postiz.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://${localDomain}:5000"; };
      };
    };
  };
  security.acme = {
    acceptTerms = true;
    defaults.server = "https://acme-staging-v02.api.letsencrypt.org/directory";
    defaults.email = "guifuentes8@gmail.com";
    certs = {
      "${domain}" = {
        domain = domain;
        webroot = "/var/lib/acme/acme-challenge";
        email = "guifuentes8@gmail.com";
        group = "nginx";
      };
      "blog.${domain}" = {
        domain = domain;
        webroot = "/var/lib/acme/acme-challenge";
        email = "guifuentes8+1@gmail.com";
        group = "nginx";
      };
    };
  };

  users.users.nginx.extraGroups = [ "acme" ];

}
