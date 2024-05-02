{ inputs, lib, pkgs, unstable, config, outputs, nix-colors, configOptions, ...
}: {

  imports =
    [ nix-colors.homeManagerModules.default ../features/cli ./systemd.nix ];

  colorScheme = nix-colors.colorSchemes.everforest-dark-hard;

  #scheme: "Everforest Dark Hard"
  #author: "Oskar Liew (https://github.com/OskarLiew)"
  #base00: "#272e33" # bg0,        Default background
  #base01: "#2e383c" # bg1,        Lighter background
  #base02: "#414b50" # bg3,        Selection background
  #base03: "#859289" # grey1,      Comments
  #base04: "#9da9a0" # grey2,      Dark foreground
  #base05: "#d3c6aa" # fg,         Default foreground
  #base06: "#e4e1cd" # bg3,        Light foreground
  #base07: "#fdf6e3" # bg0,        Light background
  #base08: "#7fbbb3" # blue
  #base09: "#d699b6" # purple
  #base0A: "#dbbc7f" # yellow
  #base0B: "#83c092" # aqua
  #base0C: "#e69875" # orange
  #base0D: "#a7c080" # green
  #base0E: "#e67e80" # red
  #base0F: "#4C3743" # bg_visual

  home = {
    username = lib.mkDefault "guifuentes8";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = configOptions.systemVersion;
    sessionVariables = { };
    packages = [
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      pkgs.age
      unstable.nh
      pkgs.nix-output-monitor
      pkgs.nvd
    ];
  };

  programs = {
    git.enable = true;
    home-manager.enable = true;
    zsh.localVariables = {
      #  GH_TOKEN = "$(${pkgs.pass}/bin/pass show github/token)";
    };
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

