{ config, pkgs, ... }:
let domain = "guifuentes8.com.br";
in {
  services = {
    cloudflared = {
      enable = true;
      package = pkgs.unstable.cloudflared;
      user = "guifuentes8";
      tunnels = {
        "c38c83cf-b8e8-4f15-962c-5c48673fa218" = {
          credentialsFile =
            "${config.users.users.guifuentes8.home}/.cloudflared/c38c83cf-b8e8-4f15-962c-5c48673fa218.json";
          default = "http_status:404";
          ingress."cloud.${domain}" = "http://localhost:9010";
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
          ingress = {
            "${domain}" = "http://localhost:80";
            "git.${domain}" = "http://localhost:9000";
            "code.${domain}" = "http://localhost:9001";
            "db.${domain}" = "http://localhost:9002";
            "draw.${domain}" = "http://localhost:9003";
            "wiki.${domain}" = "http://localhost:9004";
            "vault.${domain}" = "http://localhost:9011";
            "jellyfin.${domain}" = "http://localhost:9012";
            "google.${domain}" = "http://localhost:9020";
            "convert.${domain}" = "http://localhost:9021";
            "yt.${domain}" = "http://localhost:9022";
            "torrent.${domain}" = "http://localhost:9023";
            "status.${domain}" = "http://localhost:9030";
            "nextcloud-whiteboard.${domain}" = "http://localhost:9100";
            "office.${domain}" = "http://localhost:9101";
          };
        };
      };
    };
  };
  environment.systemPackages = [ pkgs.unstable.cloudflared ];
}
