{

  services.nginx.virtualHosts."nextcloud".listen = [{
    addr = "192.168.0.10";
    port = 9000;
  }];

  services.nginx.virtualHosts."localhost" = {
    # enableACME = true;
    forceSSL = false;
    locations."/" = {
      proxyPass = "http://localhost:8080";
      proxyWebsockets = true; # needed if you need to use WebSocket
      extraConfig =
        # required when the target is also TLS server with multiple hosts
        "proxy_ssl_server_name on;" +
        # required when the server wants to use HTTP Authentication
        "proxy_pass_header Authorization;";
    };
  };
}
