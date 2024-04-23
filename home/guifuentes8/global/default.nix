{ inputs, lib, pkgs, config, outputs, nix-colors, configOptions, ... }: {

  imports =
    [ nix-colors.homeManagerModules.default ../features/cli ./systemd.nix ];

  colorScheme = nix-colors.colorSchemes.catppuccin-mocha;

  home = {
    username = lib.mkDefault "guifuentes8";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = configOptions.systemVersion;
    sessionVariables = {
      PASSWORD_STORE_DIR =
        lib.mkForce "${config.home.homeDirectory}/nix-config/password-store";
    };
    packages = with pkgs;
      [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  };

  programs = {
    git.enable = true;
    home-manager.enable = true;
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      music = "${config.home.homeDirectory}/Music";
      videos = "${config.home.homeDirectory}/Videos";
      pictures = "${config.home.homeDirectory}/Pictures";
      download = "${config.home.homeDirectory}/Downloads";
      desktop = "${config.home.homeDirectory}/Desktop";
      documents = "${config.home.homeDirectory}/Documents";
      extraConfig = {
        work = "${config.home.homeDirectory}/Work";
        notes = "${config.home.homeDirectory}/Notes";
      };
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    overlays = [ inputs.nur.overlay ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
      permittedInsecurePackages = [
        "python-2.7.18.6"
        "electron-12.2.3"
        "electron-19.1.9"
        "electron-24.8.6"
        "nix-2.16.2"
      ];
    };
  };

  fonts.fontconfig.enable = true;
  systemd.user.startServices = "sd-switch";
  news.display = "silent";
}

