{ pkgs, ... }: {
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
  #environment.systemPackages = with pkgs; [bitwarden firefox];
  services.getty.autologinUser = "guifuentes8";

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "guifuentes8";
  };
  environment.systemPackages = [
    pkgs.firefox
    pkgs.qbittorrent
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
