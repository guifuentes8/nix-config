{ pkgs, config, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../common
    ../common/boot/systemd-boot.nix
    ../common/users/guifuentes8.nix
    ../stylix.nix

    # services
    ./docker-services.nix
    ./gitea.nix
    ./gollum.nix
    ./homepage-dashboard.nix
    ./jellyfin.nix
    ./nextcloud.nix
    ./transmission.nix
    ./vscode-server.nix
    ./vaultwarden.nix
    ./writefreely.nix

    #    ./jackett.nix
    #    ./sonarr.nix
    #    ./radarr.nix
    #    ./lidarr.nix

    # Extra config
    ./borg.nix
    ./cloudflare.nix
    ./console.nix
    ./nginx.nix
    ./networking.nix
    ./postgres.nix
  ];

  services.getty.autologinUser = "guifuentes8";
  services.openssh.enable = true;

  fileSystems."/mnt/storage_backup" = {
    device = "/dev/disk/by-uuid/433cc6cc-561e-4783-b33c-d523378eefd9";
    fsType = "ext4";
    depends = [ "/mnt/storage" ];
    options = [ "nofail" "users" ];
  };
  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/b22affd9-1505-4214-8acf-57468a600899";
    fsType = "ext4";

    options = [ "users" "nofail" ];
  };

}
