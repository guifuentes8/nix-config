{ inputs, lib, pkgs, config, outputs, systemVersion, nix-colors, ... }:
let
  cursor-theme = "everforest-cursors";
  cursor-size = "32";
in {

  imports = [ nix-colors.homeManagerModules.default ./pkgs ./services.nix ];

  home = {
    username = "guifuentes8";
    homeDirectory = "/home/guifuentes8";
    stateVersion = systemVersion;
    sessionVariables = {
      XCURSOR_THEME = "${cursor-theme}";
      XCURSOR_SIZE = "${cursor-size}";
      PASSWORD_STORE_DIR =
        lib.mkForce "${config.home.homeDirectory}/nix-config/password-store";
    };
  };

  xdg.userDirs = {
    music = "${config.home.homeDirectory}/Music";
    videos = "${config.home.homeDirectory}/Videos";
    pictures = "${config.home.homeDirectory}/Pictures";
    download = "${config.home.homeDirectory}/Download";
    desktop = "${config.home.homeDirectory}/Desktop";
    documents = "${config.home.homeDirectory}/Documents";
  };

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
        "electron-24.8.6"
      ];
    };
  };

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
  systemd.user.startServices = true;
  news.display = "silent";

  ######## GLOBAL THEME ########
  #colorScheme = nix-colors.colorSchemes.material-palenight;
  colorScheme = nix-colors.lib.schemeFromYAML "material_deep_ocean"
    (builtins.readFile ./pkgs/themes/material_deep_ocean.yaml);
  xsession.numlock.enable = true;
  xresources.extraConfig = ''
    Xcursor.theme: ${cursor-theme}
    Xcursor.size: ${cursor-size}
  '';

}

