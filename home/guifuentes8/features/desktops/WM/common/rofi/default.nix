{ pkgs, lib, config, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "kitty";
    theme = (import ./theme.nix { inherit config lib; });
    plugins = with pkgs; [
      rofi-bluetooth
      rofi-calc
      rofi-emoji
      rofi-power-menu
      rofi-pulse-select
      rofi-systemd
      rofi-rbw
    ];
  };

  home.packages = with pkgs; [
    rofi-bluetooth
    rofi-calc
    rofi-emoji
    rofi-power-menu
    rofi-pulse-select
    rofi-systemd
    rofi-rbw
    bitwarden-cli
  ];

  programs.rbw = {
    enable = true;
    settings = {
      pinentry = pkgs.pinentry-gnome3;
      base_url = "https://vault.bitwarden.com";
      identity_url = "https://identity.bitwarden.com";
      email = "guifuentes8@gmail.com";
    };
  };

}
