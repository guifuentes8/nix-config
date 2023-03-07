{ config, pkgs, inputs, outputs, ... }:
let

in
{
  imports =
    [
      ./hardware-configuration.nix
      ../common/global
      ../common/optional/boot/systemd-boot.nix
      ../common/optional/hardware/bluetooth.nix
      ../common/optional/login-manager/sddm.nix
      ../common/optional/services/flatpak.nix
      ../common/optional/services/gnome-keyring.nix
      ../common/optional/services/teamviewer.nix
      ../common/optional/sound/pipewire.nix
      ../common/users/guifuentes8
      inputs.hyprland.nixosModules.default

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
    hyprland.enable = true;
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

  environment = {
    pathsToLink = [ "/libexec" ];
    variables = {
      KITTY_ENABLE_WAYLAND = "1";
      HYPRLAND_LOG_WLR = "1";

      # Tell XWayland to use a cursor theme
      XCURSOR_THEME = "Catppuccin-Macchiato-Dark-Cursors";

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
