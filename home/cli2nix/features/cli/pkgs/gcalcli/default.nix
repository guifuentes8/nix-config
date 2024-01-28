{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    gcalcli
  ];

  systemd.user.services.gcalcli-remind = {
    Install.WantedBy = [ "graphical-session.target" ];
    Service = { ExecStart = "${pkgs.gcalcli}/bin/gcalcli remind"; };
  };

  systemd.user.timers.gcalcli-remind = {
    Install.WantedBy = [ "default.target" ];
    Timer.OnCalendar = "*:0/5";
    Timer.Unit = "gcalcli-remind.service";
  };
}
