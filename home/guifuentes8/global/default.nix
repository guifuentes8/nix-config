{ inputs, lib, pkgs, config, outputs, systemVersion, nix-colors, theme, ... }: {

  imports = [ ../features/cli ./theme.nix ];

  home = {
    username = lib.mkDefault "guifuentes8";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = lib.mkDefault "23.11";
    sessionVariables = {
      WARP_THEMES_DIR =
        "${config.home.homeDirectory}/.local/share/warp-terminal/themes";
      PASSWORD_STORE_DIR =
        lib.mkForce "${config.home.homeDirectory}/nix-config/password-store";
    };
    # persistence = {
    #   "/persist/home/guifuentes8" = {
    #     directories = [
    #       "Documents"
    #       "Downloads"
    #       "Pictures"
    #       "Videos"
    #       ".local/bin"
    #       ".local/share/nix" # trusted settings and repl history
    #     ];
    #     allowOther = true;
    #   };
    # };
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
    package = lib.mkDefault pkgs.nix;
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
        "mailspring-1.12.0"
      ];
    };
  };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs;
    [ (nerdfonts.override { fonts = [ "JetBrainsMono" "CascadiaCode" ]; }) ];

  programs = {
    git.enable = true;
    home-manager.enable = true;
  };

  systemd.user.startServices = "sd-switch";
  news.display = "silent";
}

