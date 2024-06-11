{ pkgs, ... }:

{
  imports = [ ./dunst.nix ./mpv.nix ./qutebrowser.nix ./rofi ./xdg.nix ];

  services = {
    caffeine.enable = true;
    kdeconnect = {
      enable = true;
      indicator = true;
    };

    nextcloud-client = {
      enable = true;
      startInBackground = true;
    };
  };

  # Common programs Windows Managers
  programs = { zathura.enable = true; };
  home.packages = [ pkgs.beeper ];
  systemd.user = {
    services.polkit-kde-authentication-agent-1 = {
      Unit = {
        Description = "polkit-kde-authentication-agent-1";
        After = "graphical-session.target";
      };
      Service = {
        Type = "simple";
        ExecStart =
          "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-agent";
        TimeoutStopSec = "10";
        KillMode = "process";
        KillSignal = "SIGINT";
      };
      Install.WantedBy = [ "graphical-session.target" ];
    };

  };
}
