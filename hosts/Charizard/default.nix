{ pkgs, config, ... }: {
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

  ];

  # SYSTEM CONFIGS --------------------------------------

  # Custom config
  console.keyMap = "us";
  services.xserver.xkb.layout = "us";
  networking.hostName = "Charizard";

  boot.loader = {
    grub = {
      enable = true;
      useOSProber = true;
      efiSupport = false;
      efiInstallAsRemovable = false;
      default = "saved";
      device = "/dev/nvme0n1";
    };
    efi = { canTouchEfiVariables = false; };
  };

  fileSystems."/run/media/guifuentes8/PokeStorage" = {
    device = "/dev/disk/by-uuid/c0d80b92-01f8-4298-be55-b1843b8a6506";
    fsType = "btrfs";
    options = [
      # If you don't have this options attribute, it'll default to "defaults"
      # boot options for fstab. Search up fstab mount options you can use
      "users" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount

    ];
  };
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    cursor = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size = 30;
    };
    fonts = {
      monospace = {
        name = "JetBrainsMonoNL Nerd Font";
        package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
      };
    };
    opacity = {
      applications = 0.8;
      terminal = 0.85;
      desktop = 0.8;
    };
    image = ./wallpaper.png;
    override = { };
    targets = { nixvim.enable = false; };
  };

}
