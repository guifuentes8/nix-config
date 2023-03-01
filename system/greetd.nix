{ config, lib, pkgs, ... }:
let

in
{
  services.greetd = {
    vt = 2;
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd sway -t --asterisks --remember --remember-user-session --user-menu -g 'Welcome, Guilherme!'";
        user = "greeter";
      };

    };
  };

  environment.etc."greetd/environments".text = ''
    sway
    Hyprland
  '';

  boot.kernelParams = [ "console=tty1" ];
}
