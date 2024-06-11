{ outputs, pkgs, ... }:

{
  security.pam.services.gdm-password.enableGnomeKeyring = true;
  services.xserver = {
    enable = true;
    displayManager.gdm = { enable = true; };
  };
}
