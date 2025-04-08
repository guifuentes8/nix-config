{ pkgs, ... }: {
  imports = [

    # HARDWARE ----------------------------------------

    # Hardware config (required)
    ./hardware-configuration.nix
    ../common/hardware/bluetooth.nix
    ../common/hardware/logitech.nix

    # Hardware Gpu (if exist)

    # NIXOS CONFIG ------------------------------------

    # global NixOs Config 
    ../common

    # Boot initial (grub or systemd)
    ../common/boot/grub.nix

    # Choice Interface (WM and/or DE)
    ../common/interfaces/DE/xfce.nix

    # Active services
    ../common/services/backlight.nix
    ../common/services/flatpak.nix

    ../common/services/temperature.nix
    ../common/services/dev

    # User 
    ../common/users/guifuentes8.nix
    ../stylix.nix

  ];

  # SYSTEM CONFIGS --------------------------------------

  # custom system config

  # console.keyMap = "br-abnt2";
  # services.xserver.xkb.layout = "br";
  # services.xserver.xkb.variant = "abnt2";
  console.keyMap = "us";
  services.xserver.xkb.layout = "us";
  networking.hostName = "mercury";
  stylix.image = ../../home/modules/common/extras/mercury.jpg;
}
