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

  xdg.userDirs = {
    music = "${config.home.homeDirectory}/Music";
    videos = "${config.home.homeDirectory}/Videos";
    pictures = "${config.home.homeDirectory}/Pictures";
    download = "${config.home.homeDirectory}/Download";
    desktop = "${config.home.homeDirectory}/Desktop";
    documents = "${config.home.homeDirectory}/Documents";
  };

}



