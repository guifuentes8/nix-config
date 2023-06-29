{ config, pkgs, inputs, outputs, ... }:
{
  imports =
    [
      # HARDWARE ----------------------------------------

      # Hardware config
      ./hardware-configuration.nix

      # Hardware Gpu (if exist)
      ../global/config/hardware/amdgpu.nix

      # Extra Hardware config
      ../global/config/hardware/logitech.nix
      ../global/config/hardware/keychron.nix

      # NIXOS CONFIG ------------------------------------

      # Global NixOs Config 
      ../global

      # Boot initial (grub or systemd)
      ../global/config/boot/systemd-boot.nix

      # Login Manager + Session (required after new home-manager xsession DE/WM change...)
      ../global/config/login/greetd.nix

      # Choice Interface (WM and/or DE)
      ../global/interfaces/WM/wayland/hyprland

      # Active services
      ../global/config/services/gnome-keyring.nix

      # User 
      ../global/users/guifuentes8.nix

    ];

  boot.kernelParams = [ ];
  console.keyMap = "us";
  time.timeZone = "America/Sao_Paulo";
  time.hardwareClockInLocalTime = true;


  networking.hostName = "desktop-wayland";
  networking.networkmanager.enable = true;

  # Sound Service (Pipewire)

  sound.enable = true;
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

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


  hardware = {
    opengl = {
      enable = true;
    };
  };

  environment = {
    pathsToLink = [ "/libexec" ];
    variables = {
      KITTY_ENABLE_WAYLAND = "1";
      HYPRLAND_LOG_WLR = "1";

      # Tell XWayland to use a cursor theme
      XCURSOR_THEME = "Bibata-Modern-Ice";

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
      NIXOS_OZONE_WL = "1";
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
