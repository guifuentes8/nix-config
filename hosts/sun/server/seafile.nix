{ config, pkgs, lib, ... }:

{
  services.seafile = {
    enable = true;
    seahubPackage = pkgs.unstable.seahub;
    adminEmail = "admin@example.com";
    initialAdminPassword = "SenhaSegura123";
    ccnetSettings.General = { SERVICE_URL = "http://10.10.10.10"; };

    seafileSettings.fileserver = {
      host = "127.0.0.1";
      port = 8082;
    };
    seahubAddress = "127.0.0.1:8083";
    seahubExtraConf = ''
      ALLOWED_HOSTS = ['10.10.10.10']
      CSRF_TRUSTED_ORIGINS = ['http://10.10.10.10']
    '';
  };

  services.nginx = {
    enable = true;
    virtualHosts."10.10.10.10" = { # responde para qualquer IP/domínio
      default = true;
      listen = [{
        addr = "10.10.10.10";
        port = 80;
      }];

      locations = {
        "/" = {
          proxyPass = "http://127.0.0.1:8083";
          proxyWebsockets = true;
        };
        "/seafhttp" = {
          proxyPass = "http://127.0.0.1:8082";
          extraConfig = ''
            proxy_request_buffering off;
          '';
        };
      };
    };
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 8082 8083 ];
  };
}

