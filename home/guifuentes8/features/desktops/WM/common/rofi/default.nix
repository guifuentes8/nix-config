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
  ];

  programs.rbw = {
    enable = true;
    settings = {
      email = "guifuentes8@gmail.com";
      pinentry = pkgs.pinentry-gnome3;
    };
  };

}
