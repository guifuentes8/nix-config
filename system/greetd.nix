{ config, lib, pkgs, ... }:
let

in
{
  services.greetd = {
    vt = 2;
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -c Hyprland -t --asterisks --remember --remember-session -g 'Welcome, Guilherme!' -power-shutdown 'shutdown -h now' -power-reboot 'shutdown -r now'";
        user = "greeter";
      };
      initial_session = {
        command = "Hyprland";
        user = "guifuentes8";
      };
    };
  };

  boot.kernelParams = [ "console=tty1" ];
}
