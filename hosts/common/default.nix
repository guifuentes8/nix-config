# This file (and the global directory) holds config that i use on all hosts
{ config
, lib
, inputs
, outputs
, pkgs
, nix-colors
, unstable
, configOptions
, ...
}: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  services = {
    teamviewer.enable = true;
    tailscale.enable = true;
    tailscale.package = unstable.tailscale;
    tailscale.useRoutingFeatures = "client";
    dbus = {
      enable = true;
      packages = [ pkgs.gcr ];
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  programs = {
    dconf.enable = true;
    # nh = {
    #   enable = true;
    #   clean = {
    #     enable = true;
    #     extraArgs = "--keep-since 4d --keep 3";
    #   };
    #   flake = "/home/guifuentes8/nix-config";
    # };
  };

  environment = {
    systemPackages =
      [ unstable.nh pkgs.git unstable.anydesk unstable.teamviewer ];
    sessionVariables = {
      FLAKE = "/home/guifuentes8/nix-config";
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_BIN_HOME = "\${HOME}/.local/bin";
      XDG_DATA_HOME = "\${HOME}/.local/share";
      PATH = [ "\${XDG_BIN_HOME}" ];
      TZ = "America/Sao_Paulo";
    };
    pathsToLink = [ "/libexec" "/etc" ];
  };

  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {
    inherit inputs outputs nix-colors unstable configOptions;
  };

  # Network
  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 ];
    };
  };
  time = {
    hardwareClockInLocalTime = true;
    timeZone = lib.mkDefault "America/Sao_Paulo";
  };

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;

  # Fonts
  fonts.packages = with pkgs;
    [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  # Security
  security.rtkit.enable = true;
  security.polkit.enable = true;

  # Language
  i18n = {
    defaultLocale = lib.mkDefault "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = lib.mkDefault "pt_BR.utf8";
      LC_IDENTIFICATION = lib.mkDefault "pt_BR.utf8";
      LC_MEASUREMENT = lib.mkDefault "pt_BR.utf8";
      LC_MONETARY = lib.mkDefault "pt_BR.utf8";
      LC_NAME = lib.mkDefault "pt_BR.utf8";
      LC_NUMERIC = lib.mkDefault "pt_BR.utf8";
      LC_PAPER = lib.mkDefault "pt_BR.utf8";
      LC_TELEPHONE = lib.mkDefault "pt_BR.utf8";
      LC_TIME = lib.mkDefault "pt_BR.UTF-8";
    };
    supportedLocales =
      lib.mkDefault [ "en_US.UTF-8/UTF-8" "pt_BR.UTF-8/UTF-8" ];
  };

  nix = {
    settings = {
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };
  };
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    hostPlatform = "x86_64-linux";
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
  system = {
    stateVersion = configOptions.systemVersion;
    autoUpgrade = {
      enable = false;
      allowReboot = false;
      dates = "daily";
    };
  };

  # Hardware
  powerManagement.cpuFreqGovernor = lib.mkForce "performance";

}
