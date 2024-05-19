{ pkgs, ... }:
{
  boot.loader = {
    grub = {
      enable = true;
      useOSProber = true;
      efiSupport = true;
      default = "saved";
      device = "nodev";
      darkmatter-theme = {
        enable = true;
        style = "nixos";
        icon = "color";
        resolution = "1080p";
      };

    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
  environment.systemPackages = with pkgs; [
    ntfs3g # necessary to detected windows in grub
  ];

}
