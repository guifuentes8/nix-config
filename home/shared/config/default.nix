{ inputs, lib, pkgs, config, outputs, ... }:
{

  imports = [
    ./colorscheme
  ];

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
      permittedInsecurePackages = [
        "python-2.7.18.6"
        "electron-12.2.3"
        "electron-19.1.9"
      ];
    };
  };




  home = {
    username = "guifuentes8";
    homeDirectory = "/home/guifuentes8";
    stateVersion = "23.05";
    sessionVariables = {
      PASSWORD_STORE_DIR = lib.mkForce "${config.home.homeDirectory}/nix-config/password-store";
    };
  };
  programs.home-manager.enable = true;
  systemd.user.startServices = true;
  xdg.userDirs = {
    music = "${config.home.homeDirectory}/Music";
    videos = "${config.home.homeDirectory}/Videos";
    pictures = "${config.home.homeDirectory}/Pictures";
    download = "${config.home.homeDirectory}/Download";
    desktop = "${config.home.homeDirectory}/Desktop";
    documents = "${config.home.homeDirectory}/Documents";
  };

}



