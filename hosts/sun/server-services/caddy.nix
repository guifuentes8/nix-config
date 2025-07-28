{ config, ... }:
let
  magicDns = "sun.mau-becrux.ts.net";
  localDomain = "localhost";
  extraConfigCaddy = port: ''
    encode gzip
    reverse_proxy ${localDomain}:${port}
  '';

  #tls internal
  # 9000-9009 -> Dev tools
  # 9010-9019 -> Personal tools
  # 9020-9029 -> Utils tools
  # 9030-9039 -> Server tools
  # 9090-9099 -> Public tools
in {
  services.caddy = {
    enable = true;
    virtualHosts = {
      "${magicDns}:9100".extraConfig = extraConfigCaddy "9000";
      "${magicDns}:9101".extraConfig = extraConfigCaddy "9001";
      "${magicDns}:9102".extraConfig = extraConfigCaddy "9002";
      "${magicDns}:9103".extraConfig = extraConfigCaddy "9003";
      "${magicDns}:9104".extraConfig = extraConfigCaddy "9004";
      "${magicDns}:9105".extraConfig = extraConfigCaddy "9005";
      "${magicDns}:9106".extraConfig = extraConfigCaddy "9006";
      "${magicDns}:9107".extraConfig = extraConfigCaddy "9007";
      "${magicDns}:9108".extraConfig = extraConfigCaddy "9008";
      "${magicDns}:9109".extraConfig = extraConfigCaddy "9009";
      #  "${domain}".extraConfig = extraConfigCaddy "9001";
      #  "excalidraw.${domain}".extraConfig = extraConfigCaddy "9003";

      #     "git.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:9000"; };
      #     };
      #     "code.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:9001"; };
      #     };
      #     "db.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:9002"; };
      #     };
      #     "draw.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:9003"; };
      #     };
      #     "wiki.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:9004"; };
      #     };
      #     "dav.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = {
      #         proxyPass = "http://${localDomain}:9005";
      #         extraConfig = ''
      #           rewrite ^/.well-known/carddav /radicale/ redirect;
      #           rewrite ^/.well-known/caldav /radicale/ redirect;
      #         '';
      #       };
      #     };

      #    "cloud.${domain}" = {
      #      listen = [{
      #        addr = "0.0.0.0";
      #        port = 80;
      #      }];
      #      locations = {
      #        "/" = {
      #          proxyPass = "http://${localDomain}:9101";
      #          proxyWebsockets = true;
      #          extraConfig = ''
      #            ${extraConfigNginx} 
      #          '';
      #        };
      #        "/seafhttp" = {
      #          proxyPass = "http://${localDomain}:9100";
      #          extraConfig = ''
      #            rewrite ^/seafhttp(.*)$ $1 break;
      #            ${extraConfigNginx} 
      #          '';
      #        };
      #      };
      #    };
      #    "photos.${domain}" = {
      #      listen = [{
      #        addr = "0.0.0.0";
      #        port = 80;
      #      }];
      #      forceSSL = false;
      #      locations."/" = {
      #        proxyPass = "http://${localDomain}:9006";
      #        proxyWebsockets = true;
      #        extraConfig = ''
      #          ${extraConfigNginx} 
      #        '';
      #      };
      #    };

      #     "vault.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:9011"; };
      #     };
      #     "jellyfin.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:9012"; };
      #     };
      #     "google.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:9020"; };
      #     };
      #     "convert.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:9021"; };
      #     };
      #     "yt.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:9022"; };
      #     };
      #     "torrent.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:9023"; };
      #     };
      #     "status.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:9030"; };
      #     };
      #     #"blog.${domain}" = {
      #     # forceSSL = true;
      #     #       useACMEHost = "${domain}";
      #     #  locations."/" = { proxyPass = "http://${localDomain}:9090"; };
      #     # };
      #     "docsign.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:9091"; };
      #     };
      #     "social.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:9092"; };
      #     };
      #     "nextcloud-whiteboard.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:9100"; };
      #     };
      #     "office.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:9101"; };
      #     };
      #     "postiz.${domain}" = {
      #       forceSSL = true;
      #       useACMEHost = "${domain}";
      #       locations."/" = { proxyPass = "http://${localDomain}:5000"; };
      #     };
    };
  };
  #  security.acme = {
  #    acceptTerms = true;
  #    defaults.server = "https://acme-staging-v02.api.letsencrypt.org/directory";
  #    defaults.email = "guifuentes8@gmail.com";
  #    certs = {
  #      "${domain}" = {
  #        domain = domain;
  #        webroot = "/var/lib/acme/acme-challenge";
  #        email = "guifuentes8@gmail.com";
  #        group = "nginx";
  #      };
  #      "blog.${domain}" = {
  #        domain = domain;
  #        webroot = "/var/lib/acme/acme-challenge";
  #        email = "guifuentes8+1@gmail.com";
  #        group = "nginx";
  #      };
  #    };
  #  };
  #
  #  users.users.nginx.extraGroups = [ "acme" ];

}
