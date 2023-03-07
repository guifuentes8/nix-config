{ config, pkgs, outputs, ... }:
let

in
{
  imports =
    [
      ./hardware-configuration.nix
      ../common/global
      ../common/optional/boot/systemd-boot.nix
      ../common/optional/hardware/bluetooth.nix
      ../common/optional/login-manager/greetd.nix
      ../common/optional/services/flatpak.nix
      ../common/optional/services/gnome-keyring.nix
      ../common/optional/services/teamviewer.nix
      ../common/users/guifuentes8

    ];

  boot =
    {
      extraModprobeConfig = ''
        options hid_apple fnmode=2
      '';
    };

  console.keyMap = "br-abnt2";
  time.timeZone = "America/Sao_Paulo";

  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  security.rtkit.enable = true;

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    meslo-lgs-nf
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  programs = {
    ssh.startAgent = true;
    dconf.enable = true;
  };

  system = {
    stateVersion = "22.11";
    autoUpgrade = {
      enable = true;
      allowReboot = false;
      dates = "daily";
    };
  };

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  hardware = {
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver # LIBVA_DRIVER_NAME=iHD
        vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };



}
