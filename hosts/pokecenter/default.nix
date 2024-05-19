{pkgs,...}:{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../global
    ../global/boot/systemd-boot.nix
    ../global/users/guifuentes8.nix
    ../global/interfaces/DE/xfce.nix

    ./networking.nix
    ./nextcloud.nix
    ./postgres.nix
    ./tailscale.nix
  ];

  networking.hostName = "homelab"; # Define your hostname.
  environment.systemPackages = [pkgs.bitwarden pkgs.firefox];
  services.getty.autologinUser = "guifuentes8";
}
