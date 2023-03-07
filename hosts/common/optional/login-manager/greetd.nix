{ config, lib, pkgs, ... }:
let

in
{
  services.greetd = {
    vt = 2;
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland -t --asterisks --remember --remember-session -g 'Welcome, Guilherme!' --power-shutdown 'shutdown -h now' --power-reboot 'shutdown -r now'";
        user = "greeter";
      };
    };
  };

  boot.kernelParams = [ "console=tty1" ];
}
