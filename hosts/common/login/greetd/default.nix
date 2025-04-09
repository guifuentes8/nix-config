{ ... }: {

  imports = [ ./tty.nix ];

  boot.kernelParams = [ "console=tty1" ];
  security.pam.services.greetd.enableGnomeKeyring = true;

  services.greetd = {
    vt = 9;
    enable = true;
    settings = { };
  };

}
