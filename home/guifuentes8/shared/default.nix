{ inputs, lib, pkgs, config, outputs, ... }:
{

  imports = [
    ./programs
    ./wallpapers
  ];

  nix = {
    package = lib.mkDefault pkgs.nix;
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
    };
  };

  home = {
    username = lib.mkDefault "guifuentes8";
    homeDirectory = lib.mkDefault "/home/guifuentes8";
    stateVersion = lib.mkDefault "22.11";
  };

  programs = {
    home-manager.enable = true;
  };

  systemd.user.startServices = "sd-switch";

  gtk = {
    enable = true;
    cursorTheme.name = "Catppuccin-Frappe-Dark-Cursors";
    cursorTheme.package = pkgs.catppuccin-cursors.frappeDark;
    iconTheme.name = "Adwaita";
    iconTheme.package = pkgs.gnome.adwaita-icon-theme;
    theme = {
      name = "Catppuccin-Frappe-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        variant = "frappe";
      };
    };
  };
}
