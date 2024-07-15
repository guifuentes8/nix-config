{ pkgs, unstable, config, ... }: {
  imports = [

    # HARDWARE ----------------------------------------

    # Hardware config (required)
    ./hardware-configuration.nix

    # Hardware Gpu (if exist)
    ../common/hardware/gpu/amdgpu.nix

    # NIXOS CONFIG ------------------------------------

    # common NixOs Config 
    ../common

    # Boot initial (grub or systemd)
    ../common/boot/systemd-boot.nix
    ../common/hardware/logitech.nix

    # Login Manager
    ../common/login/sddm.nix

    # Choice Interface (WM and/or DE)
    ../common/interfaces/DE/kde.nix

    # Active services
    ../common/services/flatpak.nix
    ../common/services/dev

    # User 
    ../common/users/guifuentes8.nix
    ../stylix.nix

  ];

  # SYSTEM CONFIGS --------------------------------------

  # Custom config
  console.keyMap = "us";
  services.xserver.xkb.layout = "us";
  networking.hostName = "charizard";

}
