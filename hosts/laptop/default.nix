{ config, pkgs, inputs, outputs, ... }:
let

in
{
  imports =
    [
      # HARDWARE ----------------------------------------

      # Hardware config
      ./hardware-configuration.nix

      # Hardware Gpu (if exist)
      ../global/config/hardware/bluetooth.nix

      # Extra Hardware config
      ../global/config/hardware/logitech.nix
      ../global/config/hardware/keychron.nix

      # NIXOS CONFIG ------------------------------------

      # Global NixOs Config 
      ../global

      # Boot initial (grub or systemd)
      ../global/config/boot/systemd-boot.nix

      # Login Manager + Session (required after new home-manager xsession DE/WM change...)
      ../global/config/login/sddm.nix

      # Choice Interface (WM and/or DE)
      ../global/interfaces/WM/wayland/hyprland


      # Active services
      ../global/config/services/gnome-keyring.nix
      ../global/config/services/teamviewer.nix
      ../global/config/services/temperature.nix
      ../global/config/services/backlight.nix

      # User 
      ../global/users/guifuentes8.nix


    ];

  boot.kernelParams = [ "acpi_backlight=video" "coretemp" "kvm-intel" ];
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", GROUP="video", MODE="0664"
  '';
  console.keyMap = "br-abnt2";
  time.timeZone = "America/Sao_Paulo";

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
