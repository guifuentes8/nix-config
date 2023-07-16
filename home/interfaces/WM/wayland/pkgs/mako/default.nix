{ pkgs, ... }:
let
  alert = pkgs.writeShellScript "alert.sh" ''
    pw-play --volume=0,04 ~/nix-config/home/interfaces/WM/wayland/pkgs/mako/alert.wav
  '';
in
{
  services.mako = {
    enable = true;
    defaultTimeout = 7000;
    font = "JetbrainsMonoNL Nerd Font 12";
    borderRadius = 12;
    borderSize = 3;
    width = 500;
    extraConfig = ''
      background-color=#24283b
      text-color=#c0caf5
      border-color=#e0af68
      progress-color=over #313244
      anchor=top-right

      [urgency=high]
      border-color=#ff9e64
    '';
  };
}
