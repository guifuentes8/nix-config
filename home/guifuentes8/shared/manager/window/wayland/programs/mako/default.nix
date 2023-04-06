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

      # Colors

      background-color=#303446
      text-color=#c6d0f5
      border-color=#8caaee
      progress-color=over #414559

      [urgency=high]
      border-color=#ef9f76
    '';
  };
}
