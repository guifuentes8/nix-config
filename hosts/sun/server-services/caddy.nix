{ config, ... }:
let
  domain = "sun.mau-becrux.ts.net";
  localDomain = "127.0.0.1";
  caddyConfig = ''
    encode gzip zstd 
  '';
in {
  services.tailscale.permitCertUid = "caddy";
  services.caddy = {
    enable = true;
    virtualHosts = {
      "${domain}" = { # homer
        extraConfig = ''
          ${caddyConfig}
          reverse_proxy ${localDomain}:9000
        '';
      };

      "${domain}:9001" = { # seafile
        extraConfig = ''
          ${caddyConfig}
          handle /seafhttp* {
            uri strip_prefix seafhttp
            reverse_proxy ${localDomain}:9100
          }

          handle {
            reverse_proxy ${localDomain}:9101
          }
        '';
      };
      "${domain}:9002" = { # immich
        extraConfig = ''
          ${caddyConfig}
          reverse_proxy /* ${localDomain}:9102
        '';
      };
      "${domain}:9003" = { # radicale
        extraConfig = ''
          ${caddyConfig}
          reverse_proxy /* ${localDomain}:9103
        '';
      };
      "${domain}:9004" = { # navidrome
        extraConfig = ''
          ${caddyConfig}
          reverse_proxy /* ${localDomain}:9104
        '';
      };
      "${domain}:9005" = { # audiobookshelf
        extraConfig = ''
          ${caddyConfig}
          reverse_proxy /* ${localDomain}:9105
        '';
      };

      "${domain}:9006" = { # flatnotes
        extraConfig = ''
          ${caddyConfig}
          reverse_proxy /* http://${localDomain}:9106
        '';
      };
      "${domain}:9007" = { # convertx
        extraConfig = ''
          ${caddyConfig}
          reverse_proxy /* ${localDomain}:9107
        '';
      };
      "${domain}:9008" = { # metube
        extraConfig = ''
          ${caddyConfig}
          reverse_proxy /* http://${localDomain}:9108
        '';
      };

      "${domain}:9009" = { # karakeep
        extraConfig = ''
          ${caddyConfig}
          reverse_proxy /* http://${localDomain}:9109
        '';
      };

      "${domain}:9010" = { # vaultwarden
        extraConfig = ''
          ${caddyConfig}
          reverse_proxy /* http://${localDomain}:9110
        '';
      };
      "${domain}:9011" = { # vscode
        extraConfig = ''
          ${caddyConfig}
          reverse_proxy /* http://${localDomain}:9111
        '';
      };

      "${domain}:9012" = { # vikunja
        extraConfig = ''
          ${caddyConfig}
          reverse_proxy /* http://${localDomain}:9112
        '';
      };

      "${domain}:9013" = { # excalidraw
        extraConfig = ''
          ${caddyConfig}
          reverse_proxy /* http://${localDomain}:9113
        '';
      };
    };
  };

}
