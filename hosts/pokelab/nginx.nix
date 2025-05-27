{ config, ... }:
let
  domain = "guifuentes8.com.br";
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
        locations."/" = { proxyPass = "http://localhost:80"; };
        locations."/.well-known/acme-challenge" = {
          root = "/var/lib/acme/acme-challenge";
        };
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
      "wiki.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9004"; };
      };
      "cloud.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://127.0.0.1:9010"; };

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
      #"blog.${domain}" = {
      # forceSSL = true;
      #       useACMEHost = "${domain}";
      #  locations."/" = { proxyPass = "http://localhost:9090"; };
      # };
      "docsign.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9091"; };
      };
      "social.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9092"; };
      };
      "nextcloud-whiteboard.${domain}" = {
        forceSSL = true;
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9100"; };
      };
      #    forceSSL = true;
      "office.${domain}" = {
        useACMEHost = "${domain}";
        locations."/" = { proxyPass = "http://localhost:9101"; };
      };
      "nextcloud".listen = [{
        addr = "127.0.0.1";
        port = 9010;
      }];

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
