{ inputs, lib, pkgs, config, outputs, ... }:
{
  nixpkgs = {
    config = {
      overlays = builtins.attrValues outputs.overlays;
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
  };

  home = {
    username = lib.mkDefault "guifuentes8";
    homeDirectory = lib.mkDefault "/home/guifuentes8";
    stateVersion = lib.mkDefault "22.11";
    packages = with pkgs; [
      bitwarden
      dbeaver
      fragments
      firefox-devedition-bin
      google-chrome
      obs-studio
      mattermost-desktop
      onlyoffice-bin
      postman
      pulseaudio
      slack
      teamviewer
      tdesktop
      vscode
    ];
  };

  xdg.configFile."bottom/bottom.toml".source = ./software-configs/bottom/bottom.toml;
  xdg.configFile."bpytop/bpytop.conf".source = ./software-configs/bpytop/bpytop.conf;
  xdg.configFile."bpytop/themes/catppuccin_macchiato.theme".source = ./software-configs/bpytop/themes/catppuccin_macchiato.theme;
  xdg.configFile."cava/config".source = ./software-configs/cava/config;
  xdg.configFile."foot/foot.ini".source = ./software-configs/foot/foot.ini;
  xdg.configFile."i3/config".source = ./software-configs/i3/config;
  xdg.configFile."hypr/hyprpaper.conf".source = ./software-configs/hypr/hyprpaper.conf;
  xdg.configFile."wpaperd/output.conf".source = ./software-configs/wpaperd/output.conf;
  xdg.configFile."mpv/mpv.conf".source = ./software-configs/mpv/mpv.conf;
  xdg.configFile."sptlrx/config.yaml".source = ./software-configs/sptlrx/config.yaml;
  xdg.configFile."sway/config".source = ./software-configs/sway/config;
  xdg.configFile."spotify-player/app.toml".source = ./software-configs/spotify-player/app.toml;
  xdg.configFile."spotify-player/theme.toml".source = ./software-configs/spotify-player/theme.toml;
  xdg.configFile."waybar/config".source = ./software-configs/waybar/config;

  xdg.configFile."wallpapers" = {
    source = ./software-configs/wallpapers;
    recursive = true;
  };
}
