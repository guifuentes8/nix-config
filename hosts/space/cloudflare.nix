{ config, pkgs, ... }:
let domain = "guifuentes8.com.br";
in {
  services = {
    cloudflared = {
      enable = true;
      package = pkgs.unstable.cloudflared;
      tunnels = {
        "c38c83cf-b8e8-4f15-962c-5c48673fa218" = {
          credentialsFile =
            "${config.users.users.guifuentes8.home}/.cloudflared/c38c83cf-b8e8-4f15-962c-5c48673fa218.json";
          default = "http_status:404";
        };
        "f3fbfd5c-1119-44ef-ae31-e3fbbd808bf7" = {
          credentialsFile =
            "${config.users.users.guifuentes8.home}/.cloudflared/f3fbfd5c-1119-44ef-ae31-e3fbbd808bf7.json";
          default = "http_status:404";
        };
        "5ed076b3-deca-48c7-83d9-aa22c226cac5" = {
          credentialsFile =
            "${config.users.users.guifuentes8.home}/.cloudflared/5ed076b3-deca-48c7-83d9-aa22c226cac5.json";
          default = "http_status:404";
        };
      };
    };
  };
  environment.systemPackages = [ pkgs.unstable.cloudflared ];
}
