{pkgs,...}:{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../common
    ../common/boot/systemd-boot.nix
    ../common/users/guifuentes8.nix
    ../common/interfaces/DE/xfce.nix

    ./networking.nix
    ./nextcloud.nix
    ./postgres.nix
    ./tailscale.nix
  ];

  networking.hostName = "PokeCenter"; # Define your hostname.
  environment.systemPackages = with pkgs; [bitwarden firefox];
  services.getty.autologinUser = "guifuentes8";
}
