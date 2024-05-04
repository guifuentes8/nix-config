{ inputs, lib, pkgs, unstable, config, outputs, nix-colors, configOptions, ...
}: {

  imports =
    [ nix-colors.homeManagerModules.default ../features/cli ./systemd.nix ];

  colorScheme = nix-colors.colorSchemes.catppuccin-mocha;

  #scheme: "Catppuccin Macchiato"
  #author: "https://github.com/catppuccin/catppuccin"
  #base00: "#24273a" # base
  #base01: "#1e2030" # mantle
  #base02: "#363a4f" # surface0
  #base03: "#494d64" # surface1
  #base04: "#5b6078" # surface2
  #base05: "#cad3f5" # text
  #base06: "#f4dbd6" # rosewater
  #base07: "#b7bdf8" # lavender
  #base08: "#ed8796" # red
  #base09: "#f5a97f" # peach
  #base0A: "#eed49f" # yellow
  #base0B: "#a6da95" # green
  #base0C: "#8bd5ca" # teal
  #base0D: "#8aadf4" # blue
  #base0E: "#c6a0f6" # mauve
  #base0F: "#f0c6c6" # flamingo

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
      unstable.ferdium
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
    overlays = builtins.attrValues outputs.overlays;
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

