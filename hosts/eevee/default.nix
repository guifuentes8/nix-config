{ ... }: {
  imports = [

    # HARDWARE ----------------------------------------

    # Hardware config (required)
    ./hardware-configuration.nix
    ../common/hardware/bluetooth.nix

    # Hardware Gpu (if exist)
    ../common/hardware/gpu/intel.nix

    # NIXOS CONFIG ------------------------------------

    # global NixOs Config 
    ../common
    # Boot initial (grub or systemd)
    ../common/boot/systemd-boot.nix
    # Choice Interface (WM and/or DE)
    ../common/interfaces/DE/cinnamon.nix
    # Active services
    ../common/services/backlight.nix
    ../common/services/dev
    ../common/services/flatpak.nix
    ../common/services/gaming.nix
    ../common/services/temperature.nix
    # User 
    ../common/users/gui8.nix
    ../stylix.nix

  ];

  # SYSTEM CONFIGS --------------------------------------

  # Custom system config

  # console.keyMap = "br-abnt2";
  # services.xserver.xkb.layout = "br";
  # services.xserver.xkb.variant = "abnt2";
  console.keyMap = "us";
  services.xserver.xkb.layout = "us";
  networking.hostName = "eevee";
}
