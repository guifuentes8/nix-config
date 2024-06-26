{ config, pkgs, inputs, outputs, ... }: {
  imports = [
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

    # Active services

    ../global/services/common
    ../global/services/extra/backlight.nix
    ../global/services/extra/temperature.nix

    # User 
    ../global/users/guifuentes8.nix

  ];

  console.keyMap = "br-abnt2";
  networking.hostName = "avell";
  environment = {
    pathsToLink = [ "/libexec" ];
    variables = {
      HYPRLAND_LOG_WLR = "1";

      # Tell XWayland to use a cursor theme
      XCURSOR_THEME = "Phinger-cursors";

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
      PATH = [ "\${XDG_BIN_HOME}" ];
    };
  };

  security.pam.services.swaylock = { };
  xdg.configFile."systemd/user/cros-garcon.service.d/override.conf".text = ''
    [Service]
    Environment="PATH=%h/.nix-profile/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games:/usr/sbin:/usr/bin:/usr/games:/sbin:/bin"
    Environment="XDG_DATA_DIRS=%h/.nix-profile/share:%h/.local/share:%h/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"
  '';
}
