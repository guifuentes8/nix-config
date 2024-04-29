{ pkgs, config, configOptions, ... }: {

  environment.etc."nextcloud-admin-pass".text = "Guigui.2035";

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    hostName = "192.168.0.5";
    database.createLocally = true;
    config = {
      adminpassFile = "/etc/nextcloud-admin-pass";
      adminuser = "guifuentes8@gmail.com";
    };
    configureRedis = true;
    extraApps = {
      inherit (pkgs.nextcloud28Packages.apps) tasks mail calendar contacts;
    };
    extraAppsEnable = true;
    extraOptions.enabledPreviewProviders = [
      "OC\\Preview\\BMP"
      "OC\\Preview\\GIF"
      "OC\\Preview\\JPEG"
      "OC\\Preview\\Krita"
      "OC\\Preview\\MarkDown"
      "OC\\Preview\\MP3"
      "OC\\Preview\\OpenDocument"
      "OC\\Preview\\PNG"
      "OC\\Preview\\TXT"
      "OC\\Preview\\XBitmap"
      "OC\\Preview\\HEIC"
    ];
  };

  services.nginx = {
    enable = true;
    virtualHosts."${config.services.nextcloud.hostName}" = {
      listen = [{
        addr = "127.0.0.1";
        port = 8080;
      }];
    };
  };

  #  systemd.user = {
  #@    services.nextcloud-autosync = {
  #     description = "Auto sync Nextcloud";
  #     after = [ "network-online.target" ];
  #     serviceConfig = {
  #       Type = "simple";
  #       ExecStart = ''
  #         ${pkgs.nextcloud-client}/bin/nextcloudcmd -u wxyz98@live.com -p $(pass)
  #         --path /Notes /home/guifuentes8/Notes/ ${configOptions.nextcloudHostname}'';
  #       TimeoutStopSec = "180";
  #       KillMode = "process";
  #       KillSignal = "SIGINT";
  #   };
  #   wantedBy = [ "multi-user.target" ];
  # };
  # timers.nextcloud-autosync = {
  #   description =
  #    "Automatic sync files with Nextcloud when booted up after 5 minutes then rerun every 10 minutes";
  #   timerConfig = {
  #      OnBootSec = "10s";
  #       OnUnitActiveSec = "10s";
  #     };
  #     wantedBy = [ "multi-user.target" "timers.target" ];
  #   };
  #  };

}
