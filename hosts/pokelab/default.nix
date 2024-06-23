{ pkgs, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../common
    ../common/boot/systemd-boot.nix
    ../common/users/guifuentes8.nix

    # services
    ./homepage-dashboard.nix
    ./jellyfin.nix
    ./nextcloud.nix
    ./transmission.nix

    # Extra config
    ./borg.nix
    # ./console.nix
    ./nginx.nix
    ./networking.nix
    ./postgres.nix
    ./tailscale.nix
  ];

  networking.hostName = "pokelab"; # Define your hostname.

  services.getty.autologinUser = "guifuentes8";
  services.openssh.enable = true;
  environment.systemPackages = [ pkgs.btop ];

  fileSystems."/run/media/guifuentes8/pokestorage" = {
    device = "/dev/disk/by-uuid/e83a84e2-bead-45ee-acd9-d4b8e8183294";
    fsType = "ext4";
    options = [ "users" "nofail" ];
  };
  fileSystems."/run/media/guifuentes8/backup_files" = {
    device = "/dev/disk/by-uuid/4e4eb08a-8b04-413c-abf2-ad82258d02c2";
    fsType = "ext4";
  };
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/vice.yaml";
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
