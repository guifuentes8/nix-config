{ ... }: {
  imports = [

    # HARDWARE ----------------------------------------

    # Hardware config (required)
    ./hardware-configuration.nix
    ../common/hardware/bluetooth.nix

    # Hardware Gpu (if exist)
    ../common/hardware/gpu/nvidia-prime.nix

    # NIXOS CONFIG ------------------------------------

    # global NixOs Config 
    ../common

    # Boot initial (grub or systemd)
    ../common/boot/systemd-boot.nix

    # Login Manager
    ../common/login/gdm.nix

    # Choice Interface (WM and/or DE)
    ../common/interfaces/WM/hyprland.nix
    ../common/interfaces/DE/gnome.nix

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
  console.keyMap = "br-abnt2";
  services.xserver.xkb.layout = "br";
  services.xserver.xkb.variant = "abnt2";

  networking.hostName = "venus";

}
