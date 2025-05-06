{ lib, pkgs, outputs, ... }:

{

  imports = [
    ../modules/common/programs.nix
    #  ../modules/common/services.nix
    #../modules/common/sops.nix
    #  ../modules/common/stylix.nix
    #  ../modules/features/neovim
    ../modules/features/dev
    ../modules/features/cli
    #  ../modules/features/terminals/wezterm.nix

  ];

  home = {
    username = lib.mkDefault "droid";
    homeDirectory = lib.mkDefault "/home/droid";
    stateVersion = "24.05";
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  fonts.fontconfig.enable = true;
  systemd.user.startServices = "sd-switch";
  news.display = "silent";

  programs.zsh.initExtraFirst = "pokeget umbreon";

}
