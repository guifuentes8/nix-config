{ pkgs, ... }: {

  boot.kernelParams = [ "console=tty1" ];
  security.pam.services.greetd.enableGnomeKeyring = true;

  services.greetd = {
    vt = 1;
    enable = true;
    settings = {
      default_session = {
        command =
          "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland -t --asterisks -r --remember-user-session --user-menu -g 'Welcome, Guilherme!' --power-shutdown 'shutdown -h now' --power-reboot 'shutdown -r now'";
        user = "guifuentes8";
      };
    };
  };

}
