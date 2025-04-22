{ lib, pkgs, config, inputs, outputs, ... }:

{

  imports = [
    ./modules/common/programs.nix
    ./modules/common/services.nix
    ./modules/common/sops.nix
    ./modules/common/sops-darwin.nix

    ./modules/features/neovim
    ./modules/features/dev
    ./modules/features/cli
    ./modules/features/terminals/wezterm.nix
    ./modules/features/browsers/firefox.nix

  ];

  home = {
    username = "administrador";
    homeDirectory = "/Users/administrador";
    stateVersion = "24.11";
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  #  nixpkgs = {
  #    overlays = builtins.attrValues outputs.overlays;
  #    config = {
  #      allowUnfree = true;
  #      permittedInsecurePackages = [ ];
  #    };
  #  };

  fonts.fontconfig.enable = true;
  systemd.user.startServices = "sd-switch";
  news.display = "silent";

  programs.zsh.initExtraFirst = "pokeget espeon";
  # Only 25.05
  # targets.darwin.linkApps.enable = true;
  # targets.darwin.linkApps.directory = "Applications/";

}
