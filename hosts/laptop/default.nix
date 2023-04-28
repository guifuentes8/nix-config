{ config, pkgs, inputs, outputs, ... }:
let

in
{
  imports =
    [
      ./hardware-configuration.nix
      ../shared/global
      ../shared/optional/boot/systemd-boot.nix
      ../shared/optional/hardware/bluetooth.nix
      ../shared/optional/manager/wm/wayland/hyprland
      ../shared/optional/manager/login/sddm.nix
      ../shared/optional/services/backlight.nix
      ../shared/optional/services/flatpak.nix
      ../shared/optional/services/gnome-keyring.nix
      ../shared/optional/services/teamviewer.nix
      ../shared/optional/services/temperature.nix
      ../shared/optional/sound/pipewire.nix
      ../shared/users/guifuentes8
      inputs.hyprland.nixosModules.default

    ];

  boot.kernelParams = [ "acpi_backlight=video" ];
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", GROUP="video", MODE="0664"
  '';
  console.keyMap = "br-abnt2";
  time.timeZone = "America/Sao_Paulo";

  networking.hostName = "laptop";
  networking.networkmanager.enable = true;

  security.rtkit.enable = true;

  programs = {
    ssh.startAgent = true;
    dconf.enable = true;
    hyprland.enable = true;
  };

  system = {
    stateVersion = "23.05";
    autoUpgrade = {
      enable = false;
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

  environment = {
    pathsToLink = [ "/libexec" ];
    variables = {
      KITTY_ENABLE_WAYLAND = "1";
      HYPRLAND_LOG_WLR = "1";

      # Tell XWayland to use a cursor theme
      XCURSOR_THEME = "Catppuccin-Mocha-Dark-Cursors";

      # Set a cursor size
      XCURSOR_SIZE = "24";

      # Example IME Support: fcitx
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
      GLFW_IM_MODULE = "ibus";
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
