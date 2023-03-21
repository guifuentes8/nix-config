{ pkgs, ... }:
let
  alert = pkgs.writeShellScript "alert.sh" ''
    pw-play --volume=0,04 /home/guifuentes8/dotfiles/home/guifuentes8/shared/manager/window/wayland/programs/mako/alert.wav
  '';
in
{
  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    font = "JetbrainsMono Nerd Font 12";
    borderRadius = 8;
    borderSize = 2;
    width = 400;
    extraConfig = ''

      background-color=#24273a
      text-color=#cad3f5
      border-color=#8aadf4
      progress-color=over #363a4f
      on-notify=exec ${alert}

      [urgency=high]
      border-color=#f5a97f
    '';
  };
}
