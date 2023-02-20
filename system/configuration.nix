{ config, pkgs, ... }:
{

  imports =
    [
      ./hardware-configuration.nix
      ./hardware/default.nix
      ./greetd.nix
      ./sway.nix

    ];

  boot = {
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
      enable = false;
      libinput.enable = false;
      excludePackages = [ pkgs.xterm ];
    };
    teamviewer.enable = true;
    printing.enable = false;
    flatpak.enable = false;

  };

  # Docker
  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;


  nix = {
    settings.auto-optimise-store = true;
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
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
    stateVersion = "22.11";
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-22.11";
      allowReboot = true;
      dates = "weekly";
    };
  };

  environment = {
    pathsToLink = [ "/libexec" ];
    variables = {
      KITTY_ENABLE_WAYLAND = "1";
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
    google-chrome
    obs-studio
    onlyoffice-bin
    postman
    teamviewer
    vscode

    # Development
    python2
    python38
    gcc
    glxinfo
    sassc
    sqlite
    imagemagick
    unzip
    yt-dlp
    nodejs-16_x
    #nodejs
    docker-compose
    lsof
    nixpkgs-fmt
    yarn

  ]);

}
