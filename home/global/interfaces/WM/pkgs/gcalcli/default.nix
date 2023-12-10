{ pkgs, lib, ... }:
let
  teste = lib.readFile "${pkgs.runCommand "timestamp" { env.when = "aaa"; } "echo -n `date -d @$when +%Y-%m-%d_%H-%M-%S` > $out"}";

  secret = lib.readFile "${pkgs.runCommand "secret" { } ''
    echo ${pkgs.pass}/bin/pass show gcalcli/secret > $out
  ''}";
in
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
