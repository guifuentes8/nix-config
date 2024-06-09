{ pkgs, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../common
    ../common/boot/systemd-boot.nix
    ../common/users/guifuentes8.nix

    ./homepage-dashboard.nix
    ./borg.nix
    ./transmission.nix
    ./jellyfin.nix
    ./networking.nix
    ./nextcloud.nix
    ./postgres.nix
    ./tailscale.nix
  ];

  networking.hostName = "PokeCenter"; # Define your hostname.
  services.getty.autologinUser = "guifuentes8";
  environment.systemPackages = with pkgs; [ ];
  services.openssh.enable = true;
}
