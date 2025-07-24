{ pkgs, config, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../common/boot/systemd-boot.nix
    ../common/users/g8.nix

    # services
    ./server/docker-services.nix
    ./server/gitea.nix
    ./server/gollum.nix
    ./server/homepage-dashboard.nix
    ./server/jellyfin.nix
    ./server/seafile.nix
    ./server/radicale.nix
    ./server/transmission.nix
    ./server/vscode-server.nix
    ./server/vaultwarden.nix
    ./server/writefreely.nix

    #/server    ./jackett.nix
    #/server    ./sonarr.nix
    #/server    ./radarr.nix
    #/server    ./lidarr.nix

    #/server Extra config
    ./server/borg.nix
    ./server/console.nix
    ./server/cloudflare.nix
    ./server/nginx.nix
    ./server/networking.nix
    ./server/postgres.nix
  ];
  services.getty.autologinUser = "g8";
  services.openssh.enable = true;
  fileSystems."/var/lib/storage_backup" = {
    device = "/dev/disk/by-uuid/433cc6cc-561e-4783-b33c-d523378eefd9";
    fsType = "ext4";
    depends = [ "/var/lib/storage" ];
    options = [ "nofail" "users" "rw" ];
  };
  fileSystems."/var/lib/storage" = {
    device = "/dev/disk/by-uuid/b22affd9-1505-4214-8acf-57468a600899";
    fsType = "ext4";
    options = [ "users" "nofail" "rw" ];
  };

}
