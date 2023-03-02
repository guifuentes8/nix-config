{ config, pkgs, outputs, ... }:
let
  sddm-theme = outputs.packages.${pkgs.system}.sddm-theme;
in
{
  imports =
    [
      ./hardware-configuration.nix
      ./hardware/default.nix
      # ./greetd.nix
      ./sway.nix

    ];

  boot = {
    extraModprobeConfig = ''
      options hid_apple fnmode=2
    '';
    loader = {
      /*   grub = {
        version = 2;
        enable = true;
        useOSProber = true;
        efiSupport = true;
        default = "saved";
        device = "nodev";
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      }; */
      systemd-boot.enable = true;
      efi = {
        efiSysMountPoint = "/boot/efi";
      };
    };
  };

  console.keyMap = "br-abnt2";
  time.timeZone = "America/Sao_Paulo";

  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  security.rtkit.enable = true;

  i18n = {
    defaultLocale = "en_US.utf8";
    extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.utf8";
      LC_IDENTIFICATION = "pt_BR.utf8";
      LC_MEASUREMENT = "pt_BR.utf8";
      LC_MONETARY = "pt_BR.utf8";
      LC_NAME = "pt_BR.utf8";
      LC_NUMERIC = "pt_BR.utf8";
      LC_PAPER = "pt_BR.utf8";
      LC_TELEPHONE = "pt_BR.utf8";
      LC_TIME = "pt_BR.utf8";
    };
  };

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    meslo-lgs-nf
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  services = {
    xserver = {
      layout = "br";
      xkbVariant = "abnt2";
      enable = true;
      displayManager.sddm = {
        enable = true;
        theme = "sddm-theme";
      };

      libinput.enable = true;
      excludePackages = [ pkgs.xterm ];
    };
    mpd = {
      enable = true;
      user = "guifuentes8";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My PipeWire Output"
        }
      '';
    };
    gnome.gnome-keyring.enable = true;
    teamviewer.enable = true;
    printing.enable = false;
    flatpak.enable = false;

  };

  # Docker
  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;

  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR = "/run/user/1000"; # User-id 1000 must match above user. MPD will look inside this directory for the PipeWire socket.
  };

  programs = {
    ssh.startAgent = true;
    dconf.enable = true;
  };


  nix = {
    settings = {
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };
  };

  users = {
    defaultUserShell = pkgs.bash;
    users.guifuentes8 = {
      isNormalUser = true;
      description = "Guilherme Fuentes";
      extraGroups = [ "networkmanager" "wheel" "video" "docker" "adbusers" ];
      shell = pkgs.zsh;
    };
  };

  system = {
    autoUpgrade = {
      enable = true;
      allowReboot = false;
      dates = "daily";
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

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = (with pkgs; [

    bitwarden
    dbeaver
    fragments
    ffmpeg
    firefox-devedition-bin
    google-chrome
    obs-studio
    onlyoffice-bin
    postman
    pulseaudio
    teamviewer
    tdesktop
    vscode
    mpv
    sddm-theme

    # Development
    python38
    libsForQt5.qt5.qtmultimedia
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.phonon-backend-gstreamer
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtwayland
    libsForQt5.qt5.qtsvg
    qt6.qtwayland
    gst_all_1.gst-plugins-good
    gst_all_1.gst-libav
    gcc
    glxinfo
    sassc
    sqlite
    imagemagick
    unzip
    nodejs-16_x
    #nodejs
    docker-compose
    lsof
    nixpkgs-fmt
    yarn

  ]);

  nixpkgs.overlays = [
    (
      self: super: {
        yarn = super.yarn.override {
          nodejs = pkgs.nodejs-16_x;
        };
      }
    )
    (self: super: {
      mpv = super.mpv.override {
        scripts = [ self.mpvScripts.mpris ];
      };
    })
  ];
}
