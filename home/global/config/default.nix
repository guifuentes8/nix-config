{ inputs, lib, pkgs, config, outputs, ... }:
{
  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    config = {
      overlays = builtins.attrValues outputs.overlays;
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
      permittedInsecurePackages = [
        "python-2.7.18.6"
        "electron-12.2.3"
      ];
    };
  };

  home = {
    username = "guifuentes8";
    homeDirectory = "/home/guifuentes8";
    stateVersion = "22.11";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMonoNL Nerd Font";
      size = 13;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    iconTheme = {
      name = "Colloid";
      package = pkgs.colloid-icon-theme;
    };
    theme = {
      name = "Tokyonight-Storm-B";
      package = pkgs.tokyo-night-gtk;
    };
  };
}



