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
    font = "JetbrainsMonoNL Nerd Font 12";
    borderRadius = 8;
    borderSize = 2;
    width = 400;
    extraConfig = ''

      background-color=#1e1e2e
      text-color=#cdd6f4
      border-color=#89b4fa
      progress-color=over #313244

      [urgency=high]
      border-color=#fab387
    '';
  };
}
