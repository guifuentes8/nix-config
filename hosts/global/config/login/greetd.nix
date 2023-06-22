{ config, lib, pkgs, ... }:
{
  services.greetd = {
    vt = 2;
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland -t --asterisks -r --remember-user-session --user-menu -g 'Welcome, Guilherme!' --power-shutdown 'shutdown -h now' --power-reboot 'shutdown -r now'";
        user = "greeter";
      };
    };
  };

  boot.kernelParams = [ "console=tty1" ];
}
