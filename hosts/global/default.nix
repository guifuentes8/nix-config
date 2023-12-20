# This file (and the global directory) holds config that i use on all hosts
{ config, lib, inputs, outputs, pkgs, systemVersion, ... }:
let
  my-config = outputs.packages.${pkgs.system}.my-config;
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  # System configs
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
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  system = {
    stateVersion = systemVersion;
    autoUpgrade = {
      enable = false;
      allowReboot = false;
      dates = "daily";
    };
  };

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
  };

  # Services
  programs.dconf.enable = true;
  services = {
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

  # Network
  networking.networkmanager.enable = true;
  time.hardwareClockInLocalTime = true;
  time.timeZone = lib.mkDefault "America/Sao_Paulo";

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;

  # Fonts
  fonts.packages = with pkgs; [
    my-config
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Security
  security.rtkit.enable = true;
  security.polkit.enable = true;

  # Hardware
  powerManagement.cpuFreqGovernor = lib.mkForce "performance";

  # Language
  i18n = {
    defaultLocale = lib.mkDefault "pt_BR.UTF-8";
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
    supportedLocales = lib.mkDefault [
      "en_US.UTF-8/UTF-8"
      "pt_BR.UTF-8/UTF-8"
    ];
  };
  services.xserver = {
    layout = "br";
  };

  # Others
  qt = {
    enable = true;
    platformTheme = "gtk2";
  };


}
