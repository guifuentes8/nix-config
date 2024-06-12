{ pkgs, ... }:

{
  imports = [ ./dunst.nix ./mpv.nix ./qutebrowser.nix ./rofi ./xdg.nix ];

  # Common programs Windows Managers
  programs = { zathura.enable = true; };
}
