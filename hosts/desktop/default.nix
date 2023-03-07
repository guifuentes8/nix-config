{ config, pkgs, outputs, ... }:
let

in
{
  imports =
    [
      ../common/global
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



}
