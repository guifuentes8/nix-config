{
  boot.loader = {
    grub = {
      enable = true;
      useOSProber = true;
      efiSupport = true;
      default = "saved";
      device = "nodev";
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
}
