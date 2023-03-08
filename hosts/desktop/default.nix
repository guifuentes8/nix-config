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
      ../common/optional/hardware/nvidia.nix
    # ../common/optional/login-manager/sddm.nix
    # ../common/optional/services/flatpak.nix
    # ../common/optional/services/gnome-keyring.nix
    # ../common/optional/services/teamviewer.nix
    # ../common/optional/services/X11.nix
    # ../common/optional/wm/bspwm
      ../common/optional/sound/pipewire.nix
      ../common/users/guifuentes8
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
    stateVersion = "23.05";
    autoUpgrade = {
      enable = true;
      allowReboot = false;
      dates = "daily";
    };
  };

  services.xserver = {
    enable = true;
    layout = "us";
    displayManager = {
      defaultSession = "none+i3";
      gdm.enable = true;
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
        i3blocks #if you are planning on using i3blocks over i3status
        rxvt-unicode
     ];
    };
    windowManager.bspwm = {
      enable = true;
      configFile = "${pkgs.bspwm}/share/doc/bspwm/examples/bspwmrc";
      sxhkd.configFile = "${pkgs.bspwm}/share/doc/bspwm/examples/sxhkdrc";
    };
  };

  environment = {
    pathsToLink = [ "/libexec" "/etc" ];
    variables = {
      #      KITTY_ENABLE_WAYLAND = "1";
      #      HYPRLAND_LOG_WLR = "1";

      # Tell XWayland to use a cursor theme
      #      XCURSOR_THEME = "Catppuccin-Macchiato-Dark-Cursors";

      # Set a cursor size
      #      XCURSOR_SIZE = "24";

      # Example IME Support: fcitx
      #      GTK_IM_MODULE = "fcitx";
      #      QT_IM_MODULE = "fcitx";
      #      XMODIFIERS = "@im=fcitx";
      #      SDL_IM_MODULE = "fcitx";
      #      GLFW_IM_MODULE = "ibus";
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
