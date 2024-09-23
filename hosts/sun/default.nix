{ pkgs, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../common
    ../common/boot/systemd-boot.nix
    ../common/users/guifuentes8.nix

    # services
    #    ./adguard.nix
    ./bookstack.nix
    ./console.nix
    ./gitea.nix
    ./homepage-dashboard.nix
    ./jellyfin.nix
    ./nextcloud.nix
    ./transmission.nix
    ./tailscale.nix
    ./vscode-server.nix

    ./jackett.nix
    ./sonarr.nix
    ./radarr.nix
    ./lidarr.nix

    # Extra config
    ./borg.nix
    ./console.nix
    ./nginx.nix
    ./networking.nix
    ./postgres.nix
  ];

  services.getty.autologinUser = "guifuentes8";
  services.openssh.enable = true;
  environment.systemPackages = [ pkgs.btop ];

  fileSystems."/run/media/guifuentes8/backup_files" = {
    device = "/dev/disk/by-uuid/4e4eb08a-8b04-413c-abf2-ad82258d02c2";
    fsType = "ext4";
    options = [ "users" "nofail" "rw" ];

  };
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    fonts = {
      monospace = {
        name = "JetBrainsMonoNL Nerd Font";
        package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
      };
    };
    image = ./wallpaper.png;
    override = { };
    targets = { nixvim.enable = false; };
  };

}
