{ inputs, lib, pkgs, config, outputs, systemVersion, nix-colors, theme, ... }: {

  imports = [ nix-colors.homeManagerModules.default ];

  home = {
    username = "guifuentes8";
    homeDirectory = "/home/guifuentes8";
    stateVersion = systemVersion;
    sessionVariables = {
      XCURSOR_THEME = theme.cursor_name;
      # XCURSOR_SIZE = "${theme.cursor_size}";
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
  colorScheme = nix-colors.colorSchemes.${theme.base16ThemeName};
  #colorScheme = nix-colors.lib.schemeFromYAML "everforest"
  #  (builtins.readFile ./pkgs/themes/everforest_dark.yaml);
  xsession.numlock.enable = true;
  xresources.extraConfig = ''
    Xcursor.theme: ${theme.cursor_name}
    Xcursor.size: 32
  '';

}

