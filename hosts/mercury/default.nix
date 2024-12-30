{ pkgs, ... }: {
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

    # Login Manager
    ../common/login/greetd.nix

    # Choice Interface (WM and/or DE)
    ../common/interfaces/WM/hyprland.nix
    #../common/interfaces/DE/gnome.nix

    # Active services
    ../common/services/backlight.nix
    ../common/services/flatpak.nix

    ../common/services/temperature.nix
    ../common/services/dev
    ../common/services/wine.nix

    # User 
    ../common/users/guifuentes8.nix
    ../stylix.nix

  ];

  # SYSTEM CONFIGS --------------------------------------

  # custom system config
  #console.keyMap = "br-abnt2";
  console.keyMap = "us";
  #services.xserver.xkb.layout = "br";
  services.xserver = {
    xkb = {
      layout = "br";
      variant = "";
    };
  };
  # services.xserver.xkb.variant = "abnt2";

  networking.hostName = "mercury";

}
