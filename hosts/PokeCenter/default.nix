{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../common
    ../common/boot/systemd-boot.nix
    ../common/users/guifuentes8.nix

    ./borg.nix
    ./homepage-dashboard.nix
    ./jellyfin.nix
    ./networking.nix
    ./nextcloud.nix
    ./postgres.nix
    ./transmission.nix
    ./tailscale.nix
  ];

  networking.hostName = "PokeCenter"; # Define your hostname.
  services.getty.autologinUser = "guifuentes8";
  services.openssh.enable = true;

  fileSystems."/run/media/guifuentes8/pokestorage" = {
    device = "/dev/disk/by-uuid/e83a84e2-bead-45ee-acd9-d4b8e8183294";
    fsType = "ext4";
  };
  fileSystems."/run/media/guifuentes8/backup_files" = {
    device = "/dev/disk/by-uuid/4e4eb08a-8b04-413c-abf2-ad82258d02c2";
    fsType = "ext4";
  };

}
