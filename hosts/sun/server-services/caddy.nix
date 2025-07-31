{ config, ... }:
let
  domain = "sun.tail7606a6.ts.net";
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
          reverse_proxy ${localDomain}:9003
        '';
      };

      "${domain}:9000" = {
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
      "${domain}:9001" = {
        extraConfig = ''
          reverse_proxy ${localDomain}:9006
        '';
      };
    };
  };

}
