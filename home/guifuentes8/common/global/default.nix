{ inputs, lib, pkgs, config, outputs, ... }:
{
  imports = [
    ./programs/cli
    ./programs/dev
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

  systemd.user.startServices = "sd-switch";

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  home = {
    username = lib.mkDefault "guifuentes8";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "22.11";
    packages = with pkgs; [
      bitwarden
      dbeaver
      fragments
      firefox-devedition-bin
      google-chrome
      obs-studio
      onlyoffice-bin
      postman
      teamviewer
      tdesktop
      vscode
    ];
  };
}
