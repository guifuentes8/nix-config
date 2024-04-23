{ pkgs, configOptions, ... }: {

  systemd.user = {
    services.nextcloud-autosync = {
      Unit = {
        Description = "Auto sync Nextcloud";
        After = "network-online.target";
      };
      Service = {
        Type = "simple";
        ExecStart = ''
          ${pkgs.nextcloud-client}/bin/nextcloudcmd -u wxyz98@live.com -p $(${pkgs.pass}/bin/pass show nextcloud/secret)
          --path /Notes /home/guifuentes8/Notes/ ${configOptions.nextcloudHostname}'';
        TimeoutStopSec = "180";
        KillMode = "process";
        KillSignal = "SIGINT";
      };
      Install.WantedBy = [ "multi-user.target" ];
    };
    timers.nextcloud-autosync = {
      Unit.Description =
        "Automatic sync files with Nextcloud when booted up after 5 minutes then rerun every 10 minutes";
      Timer.OnBootSec = "5min";
      Timer.OnUnitActiveSec = "10min";
      Install.WantedBy = [ "multi-user.target" "timers.target" ];
    };
  };

}
