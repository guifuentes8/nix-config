{ config, pkgs, ... }: {
  services = {
    cloudflared = {
      enable = true;
      package = pkgs.unstable.cloudflared;
      tunnels = {
        "43526673-2258-48a0-b7d9-d659357f676a" = {
          credentialsFile =
            "${config.users.users.g8.home}/.cloudflared/43526673-2258-48a0-b7d9-d659357f676a.json";
          ingress = {
            "postiz.larquim.com.br" = { service = "http://localhost:5000"; };
          };
          default = "http_status:404";
        };
        #        "f3fbfd5c-1119-44ef-ae31-e3fbbd808bf7" = {
        #          credentialsFile =
        #            "${config.users.users.g8.home}/.cloudflared/f3fbfd5c-1119-44ef-ae31-e3fbbd808bf7.json";
        #          default = "http_status:404";
        #        };
        #        "5ed076b3-deca-48c7-83d9-aa22c226cac5" = {
        #          credentialsFile =
        #            "${config.users.users.g8.home}/.cloudflared/5ed076b3-deca-48c7-83d9-aa22c226cac5.json";
        #          default = "http_status:404";
        #        };
      };
    };
  };
  environment.systemPackages = [ pkgs.unstable.cloudflared ];
}
