{ config, ... }:
let
  domain = "sun.mau-becrux.ts.net";
  localDomain = "127.0.0.1";
  # 9000-9009 -> Dev tools
  # 9010-9019 -> Personal tools
  # 9020-9029 -> Utils tools
  # 9030-9039 -> Server tools
  # 9090-9099 -> Public tools
in {
  services.tailscale.permitCertUid = "caddy";
  services.caddy = {
    enable = true;
    virtualHosts = {
      "${domain}" = {
        extraConfig = ''
          encode gzip
        '';
      };

      "${domain}:8001" = {
        extraConfig = ''
          encode gzip zstd

          handle /seafhttp* {
            uri strip_prefix seafhttp
            reverse_proxy ${localDomain}:9009
          }

          handle {
            reverse_proxy ${localDomain}:9010
          }
        '';
      };
      "${domain}:8002" = {
        extraConfig = ''
          reverse_proxy ${localDomain}:9006
        '';
      };
    };
  };

}
