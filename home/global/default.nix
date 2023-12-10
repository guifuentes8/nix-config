{ inputs, lib, pkgs, config, outputs, systemVersion, nix-colors, ... }:
let cursor-theme = "phinger-cursors";
cursor-size = "32";
in
{

  imports = [
    nix-colors.homeManagerModules.default
    ./pkgs
    ./services.nix
  ];

  home = {
    username = "guifuentes8";
    homeDirectory = "/home/guifuentes8";
    stateVersion = systemVersion;
    sessionVariables = {
      XCURSOR_THEME = "${cursor-theme}";
      XCURSOR_SIZE = "${cursor-size}";
      PASSWORD_STORE_DIR = lib.mkForce "${config.home.homeDirectory}/nix-config/password-store";
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
  colorScheme = nix-colors.lib.schemeFromYAML "kyoto" (builtins.readFile ./pkgs/themes/kyotonight.yaml);

  xresources.extraConfig = ''
    Xcursor.theme: ${cursor-theme}
    Xcursor.size: ${cursor-size}
  '';

# scheme: "kyotonight"
  # author: "shrikecode"
  # base00: "#1a1b26"
  # base01: "#292e42"
  # base02: "#32344a"
  # base03: "#33467c"
  # base04: "#545c7e"
  # base05: "#a9b1d6"
  # base06: "#c0caf5"
  # base07: "#e4e4e5"
  # base08: "#f7768e"
  # base09: "#9ece6a"
  # base0A: "#e0af68"
  # base0B: "#7aa2f7"
  # base0C: "#ad8ee6"
  # base0D: "#73daca"
  # base0E: "#ff9e64"
  # base0F: "#db4b4b"

}



