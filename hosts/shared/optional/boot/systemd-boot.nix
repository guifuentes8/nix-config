{
  boot.loader = {
    systemd-boot = {
      enable = true;
      consoleMode = "max";
    };

    efi = {
      efiSysMountPoint = "/boot/efi";
    };
  };
}
