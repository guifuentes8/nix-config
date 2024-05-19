{ pkgs, config, configOptions, ... }: {

  # Nextcloud Auto Sync
  systemd.user = {
    services.nextcloud-autosync = {
      Unit = {
        Description = "Auto sync Nextcloud";
        After = "network-online.target";
      };
      Service = {
        Type = "simple";
        ExecStart =
          "${pkgs.nextcloud-client}/bin/nextcloudcmd -h -n --path /Notes /home/guifuentes8/Notes/ ${configOptions.nextcloudHostname}";
        TimeoutStopSec = "180";
        KillMode = "process";
        KillSignal = "SIGINT";
      };
      Install.WantedBy = [ "multi-user.target" ];
    };
    timers.nextcloud-autosync = {
      Unit.Description =
        "Automatic sync files with Nextcloud when booted up after 5 minutes then rerun every 10 minutes";
      Timer.OnBootSec = "5m";
      Timer.OnUnitActiveSec = "1m";
      Install.WantedBy = [ "multi-user.target" "timers.target" ];
    };
  };

}
