{ pkgs, config, ... }:
let
  alert = pkgs.writeShellScript "alert.sh" ''
    pw-play --volume=0,04 ~/nix-config/home/interfaces/WM/wayland/pkgs/mako/alert.wav
  '';
in
{
  services.mako = {
    enable = true;
    defaultTimeout = 3000;
    font = "JetbrainsMonoNL Nerd Font 12";
    borderRadius = 8;
    borderSize = 3;
    width = 600;
    height = 300;
    margin = "0, 40, 60, 0";
    extraConfig = ''
      background-color=#${config.colorScheme.colors.base00}
      text-color=#${config.colorScheme.colors.base0C}
      border-color=#${config.colorScheme.colors.base09}
      progress-color=over #${config.colorScheme.colors.base04}
      anchor=bottom-right
      on-notify=exec ${alert}

      [urgency=high]
      border-color=#${config.colorScheme.colors.base09}
    '';
    progressColor = "over #ff0000";
  };
}
