{ config, pkgs, inputs, outputs, ... }:
{
  imports =
    [
      # HARDWARE ----------------------------------------

      # Hardware config
      ./hardware-configuration.nix

      # Hardware Gpu (if exist)
      #../global/config/hardware/amdgpu.nix

      # Extra Hardware config
      ../global/hardware/bluetooth.nix
      ../global/hardware/gpu/intel.nix
      # ../global/config/hardware/keychron.nix

      # NIXOS CONFIG ------------------------------------

      # global NixOs Config 
      ../global

      # Boot initial (grub or systemd)
      ../global/boot/grub.nix

      # Login Manager + Session (required after new home-manager xsession DE/WM change...)
      ../global/login/lightdm.nix

      # Choice Interface (WM and/or DE)
      ../global/interfaces/WM/hyprland.nix

      # Active services
      ../global/services/backlight.nix
      ../global/services/temperature.nix
      ../global/services/kdeconnect.nix
      ../global/services/gnomeKeyring.nix


      # User 
      ../global/users/guifuentes8.nix

    ];

  console.keyMap = "br-abnt2";
  networking.hostName = "laptop";
  environment = {
    pathsToLink = [ "/libexec" ];
    variables = {
      HYPRLAND_LOG_WLR = "1";

      # Tell XWayland to use a cursor theme
      XCURSOR_THEME = "phinger-cursors";

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
      TZ = "America/Sao_Paulo";
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
