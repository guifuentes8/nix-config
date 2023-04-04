{ pkgs, ... }:
let
  alert = pkgs.writeShellScript "alert.sh" ''
    pw-play --volume=0,04 ~/nix-config/home/guifuentes8/shared/manager/window/wayland/programs/mako/alert.wav
  '';
in
{
  services.mako = {
    enable = true;
    defaultTimeout = 6000;
    font = "JetbrainsMono Nerd Font 12";
    borderRadius = 8;
    borderSize = 2;
    width = 400;
    extraConfig = ''

      background-color=#24283b
      text-color=#c0caf5
      border-color=#33cccc
      progress-color=over #363a4f
      on-notify=exec ${alert}

      [urgency=high]
      border-color=#f7768e
    '';
  };
}
