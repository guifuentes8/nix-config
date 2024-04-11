{ pkgs, ... }: {
  programs = { zathura.enable = true; };
  home.packages = with pkgs; [ pavucontrol playerctl ];
  services = { playerctld.enable = true; };

  imports = [
    ./rofi
    ./alacritty.nix
    ./dunst.nix
    ./kitty.nix
    ./qutebrowser.nix
    ./xdg.nix
  ];

  systemd.user.services = {
    polkit-gnome-authentication-agent-1 = {
      Install = { WantedBy = [ "graphical-session.target" ]; };
      Service = {
        Type = "simple";
        ExecStart =
          "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
      Unit = {
        After = [ "network.target" ];
        Description = "Himalaya folder changes watcher service";
      };
    };
  };

}
