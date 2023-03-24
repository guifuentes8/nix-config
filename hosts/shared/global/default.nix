# This file (and the global directory) holds config that i use on all hosts
{ config, lib, inputs, outputs, pkgs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

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
    supportedLocales = lib.mkDefault [
      "en_US.UTF-8/UTF-8"
      "pt_BR.UTF-8/UTF-8"
    ];
  };

  time.timeZone = lib.mkDefault "America/Sao_Paulo";

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    meslo-lgs-nf
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);

    };
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




  services.dbus.enable = true;
  services.dbus.packages = [ pkgs.gcr ];

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
  };

  environment.variables.EDITOR = "nvim";



}
