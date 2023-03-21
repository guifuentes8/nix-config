{ config, pkgs, inputs, outputs, ... }:
let

in
{
  imports =
    [
      ./hardware-configuration.nix

      ../shared/global

      ../shared/optional/boot/grub.nix
      ../shared/optional/display-manager/lightdm.nix
      ../shared/optional/hardware/bluetooth.nix
      ../shared/optional/hardware/nvidia.nix
      ../shared/optional/services/flatpak.nix
      ../shared/optional/services/gnome-keyring.nix
      ../shared/optional/services/teamviewer.nix
      ../shared/optional/sound/pipewire.nix

      ../shared/optional/wm/i3
      ../shared/optional/wm/bspwm

      ../shared/users/guifuentes8

    ];

  boot =
    {
      extraModprobeConfig = ''
        options hid_apple fnmode=2
      '';
    };

  console.keyMap = "us";
  time.timeZone = "America/Sao_Paulo";

  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  security.rtkit.enable = true;

  programs = {
    ssh.startAgent = true;
    dconf.enable = true;
  };

  system = {
    stateVersion = "23.05";
    autoUpgrade = {
      enable = false;
      allowReboot = false;
      dates = "daily";
    };
  };

  services.xserver = {
    enable = true;
    layout = "us";
  };

  environment = {
    pathsToLink = [ "/libexec" "/etc" ];
    variables = {
      XCURSOR_THEME = "Catppuccin-Macchiato-Dark-Cursors";
      XCURSOR_SIZE = "24";
    };
    sessionVariables = rec {
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_BIN_HOME = "\${HOME}/.local/bin";
      XDG_DATA_HOME = "\${HOME}/.local/share";
      PATH = [
        "\${XDG_BIN_HOME}"
      ];
    };
  };

}
