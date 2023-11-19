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
      ../shared/hardware/bluetooth.nix
      # ../shared/config/hardware/keychron.nix

      # NIXOS CONFIG ------------------------------------

      # shared NixOs Config 
      ../shared

      # Boot initial (grub or systemd)
      ../shared/boot/systemd-boot.nix

      # Login Manager + Session (required after new home-manager xsession DE/WM change...)
      ../shared/login/greetd.nix

      # Choice Interface (WM and/or DE)
      #../shared/interfaces/WM/xorg/bspwm
      ../shared/interfaces/WM/wayland/hyprland
      ../shared/interfaces/WM/wayland/sway

      # Active services
      ../shared/services/backlight.nix
      ../shared/services/firewall.nix
      ../shared/services/gnome-keyring.nix
      ../shared/services/temperature.nix

      # User 
      ../shared/users/guifuentes8.nix

    ];


  boot.kernelParams = [ "acpi_backlight=video" "coretemp" "kvm-intel" ];
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", GROUP="video", MODE="0664"
  '';
  console.keyMap = "br-abnt2";
  time.timeZone = "America/Sao_Paulo";
  time.hardwareClockInLocalTime = true;


  networking.hostName = "laptop";
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
      HYPRLAND_LOG_WLR = "1";

      # Tell XWayland to use a cursor theme
      XCURSOR_THEME = "Phinger Cursors";

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
